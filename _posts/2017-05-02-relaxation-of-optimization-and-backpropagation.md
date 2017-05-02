---
title: Relaxation of Optimization and Backpropagation
layout: post 
tags: deeplearning
---

I spent April 2017 reading up on methods of parallelizing deep learning and
looking at distributed methods. I've learnt a lot more about deep learning in the
past month. The key insight that I got:

> You don't have to strictly adhere to backpropagation or optimization
> fundamentals for Deep Learning to work. 

But then again, optimization fundamentals are not really adhered to already in
Deep Learning. The papers that we will be talking about here relax it even more.
A brief definition of how I will refer to backpropagation and optimization in
this post.

### Backpropagation

> Backpropagation is computing all the errors, which is the partial derivative of
> the error function with respect to the activation.

### Optimization (Gradient Descent)

> Optimization in this sense is making a weight update by taking the old weight,
> and subtracting it with the partial derivative of the error function with
> respect to the weight in question, multiplied by a scalar learning rate.

There are many implications. The biggest implication being we don't really
understand how Deep Learning works. Backpropagation and optimization is arguably
the core of Deep Learning, and if we can relax these, how much can we relax it
by? And if we do relax it, are there any theoretical guarantees? There's lots of
work in this field and I'm definitely not qualified to comment on it but it would
be an interesting area to work in. The equations in some of the papers are
extremely long. And I've not covered how backpropagation may not be truly
"biologically inspired". There is so much to learn. Here's a list of the papers
that I thought were intersting: 

Interesting papers on Async SGD:

- Hogwild! (Feng Niu, NIPS 2011)
- Distributed Delayed Stochastic Optimization (Alekh Agarwal, NIPS 2011)
- Large Scale Distributed Deep Networks (Jeff Dean, NIPS 2012)
- Staleness-Aware Async-SGD (Wei Zheng, IJCAI 2016)
- On Large-Batch Training for Deep Learning: Generalization Gap and Sharp Minima
  (Nitish Shirish Keskar, ICLR 2017)

Other interesting papers:

- Decoupled Neural Interfaces using Synthetic Gradients (Max Jaderberg)
- Kickback
- All other papers that explore deep learning without backpropagation

The fundamental problem we are trying to solve:

> Backpropagation is update locked. Layer 0 has to wait for forward propagation
> to Layer N, and then backpropagation to Layer 0, before all the gradients are
> obtained for an update.

What comes to mind immediately would be to pipeline it. If we were to do it and
keep within the framework of backpropagation, we would have to trade off a lot of
memory, as all the activations (non-linearity on Ax+b), multiply-accumulates
(Ax+b), and errors have to be stored. Unless of course something inherent in deep
learning allows us to relax backpropagation or optimization... 

### Pipelined Back-Propagation for Context-Dependent Deep Neural Networks

It turns out that this is possible and a group from MSRA has done it. They
achieved a 3.3x speed-up on 4 GPUs. On the surface, it seems like a near linear
scaling, which is great from the distributed perspective. So how did they do it?
Well, they basically didn't care about the delayed update. And even then, I felt
like this was an incomplete explanation. The paper didn't really explain it in
detail. They simply said that each layer is on a GPU and only data flows between
each GPU. A few questions come to mind immediately:

- Does the update happen immediately once it can update?
- Does it store the history of activations?
    - If it doesn't, that means that each update will be done based on the
      forward propagation of Batch X and backpropagation of Batch Y. How does
this even work?
- Is it really delayed updates, as what the paper mentions, or computing the
  gradient in a totally different way?

The details of their implementation were not provided at all. It could perhaps be
a trade secret. Nonetheless, it does provide some validation that pipelining is
possible. I needed to understand more about the intricacies of relaxations of
backpropagation and optimization.

### Hogwild!: A Lock-Free Approach to Parallelizing Stochastic Gradient Descent

I assume this is the canonical paper. It was in NIPS 2011 (pre AlexNet era), 624
citations (as of May 2017), and quite a few recent papers cited it.

Key idea:

> Assume a shared memory model with p processors. The decision variable x is
> accessible to all processors. All processors can read x, and can contribute an
> update vector to x. The vector x is stored in shared memory, and we assume that
> the componentwise addition operation is atomic.

What this means is that all weight parameters are stored in shared memory, and
updates on each weight is atomic. The implication of this is that weights in a
layer, or even within a kernel, can have gradients that are of different "ages".
And this also means that updates are generally done with a stale gradient. They
did some very complex mathematical proof and made some very strict assumptions to
come up with some proof. I didn't look into that in detail.

This method breaks optimization fundamentals since we are doing a weight update
with stale gradients. 

### Large Scale Distributed Deep Networks

Downpour SGD is the interesting method in this paper. NIPS 2012 with 836
citations (as of May 2017).

Key idea:

> Break down a large model and put each part into different machines. Replicate
> this large model several times. Break down the weight parameters of your large
> model and put it on a parameter server. Break down data into disjoint subsets.

Basically, it's breaking down everything into it's component parts if it's
possible. The true magic of this method is this:

> This approach is asynchronous in two distinct aspects: the model replicas run
> independently of each other, and the parameter server shards also run
> independently of one another. 

Case in point:

1. Model replica requests parameter server for updated model parameters.
2. Model replica receives model parameters (note that the parameter server is
sharded and thus these parameters are not guaranteed to be of the same age).
3. Model replica processes mini-batch from disjoint subset to compute parameter
gradient.
4. Parameter gradient sent to server. The parameter server could have been
updated already, and hence these are stale gradients.

Absolutely asynchronous. The authors put it rightly in their paper:

> Because the parameter server shards act indepedently, there is no guarantee
> that at any given moment, the parameters on each shard of the parameter server
> have undergone the same number of updates, or that the updates were applied in
> the same order. Moreover, because the model replicas are permitted to fetch
> parameters and push gradients in separate threads, there may be additional
> subtle inconsistencies in the timestamps of parameters. There is little
> theoretical grounding for the safety of these operations for nonconvex
> problems, but in practice we found relaxing consistency requirements to be
> remarkably effective.

An interesting thing to note would be Figure 4, where they initialize Downpour
after 10 hours of simple SGD. I'm not exactly sure why you need the warm start.
In fact, according to Keskar (ICLR 2017), it should be the other way round.
Downpour before simple SGD. We will talk about that later on.

This method breaks optimization fundamentals since we are doing a weight update
with stale gradients. On top of that, we are processing each batch on
inconsistent weights (weights from different time steps and even possibly
different update orderings). Since all the weights are inconsistent, it can
perhaps be said that forward propagation and backpropagation is "broken", when
viewed from a very strict perspective. The fact that this still works suggests
that we really do not understand Deep Learning that thoroughly yet.

### Staleness-Aware Async-SGD for Distributed Deep Learning

This paper improved on Dean et al. (2012). Specifically, there was just one magic
bullet. The learning rate is modulated by the "staleness" of the gradient. If I
am making an update on a weight that is at time step 100 and the gradient was
calculated on the weights at time step 90, I simply multiply the learning rate by
1/10. Conversely, if the gradient was calculated on the weights at time step 99,
I simply multiply the learning rate by 1/1. This means that stale gradients are
heavily (well linearly, we could do it quadratically too) weighted down. 

And they had really nice graphs to show the effect of the staleness-aware
gradient update on CIFAR10 and ImageNet. This is extremely relevant because most
state-of-the-art models are now very similar to this.

On one hand, Dean et al. showed that things still worked with stale gradients.
Yet on the other hand, Zhang et al. showed that things worked even better when we
weigh down stale gradients. And if we weigh down stale gradients too much, it
effectively becomes something like normal SGD, since these stale updates would
generally be ignored. Where exactly do we draw the line? Intuitively, it seems
like Zhang et al. has found a good starting point, since it's a balance of
totally stale updates VS no stale updates.

### Decoupled Neural Interfaces using Synthetic Gradients

I refer you to [DeepMind's post](https://deepmind.com/blog/decoupled-neural-networks-using-synthetic-gradients/) for this, as they explain it really well with
animations and the like. Simply put, this paper decouples all the layers. When we
do a forward propagation, we can immediately receive a gradient from a synthetic
gradient module, and then do weight updates from there. In the truest sense, if
this works, pipelining can be done! The only concern would be that the synthetic
gradient module would still be update locked as it has to wait for the correct
gradients to flow back. It seems like a good trade off nonetheless.

An interesting thing to try would be to train some image recognition networks on
this and study what filters this network actually learned. This breaks
backpropagation fundamentals, but the authors seem to suggest it works (I haven't
read it thoroughly).

### On Large-Batch Training for Deep Learning: Generalization Gap and Sharp Minima

I can see why this is an ICLR 2017 Oral Paper. Deep Learning literature has
generally used small batch sizes of 128, 256, 512, but never batch sizes like
1024 or 2048. Why is that the case? Memory could be an issue for sure, but for
smaller datasets like CIFAR10, a GPU with 11GB RAM could operate on small
networks with huge batches. And when we actually try this, models cannot
converge. 

The key intuition I had before this was that large batch sizes have less noisy
gradients. When we start a fresh model with "accurate gradients", we could be
doing gradient descent on a bad loss surface and thus fail to converge or
converge to very bad minima. However, when we have small batch sizes, we have
noisy gradients and tend to "jump around" the loss surface, and as we anneal the
learning rate, start to descend to the minima over time. 

This paper formalizes the intuition and came up with a metric to find the
sharpness of the minima, and large-batch methods tend to converge to sharp
minimzers and small-batch methods tend to converge to flat minimizers.

One experiment that I liked about this paper is that "high testing accuracy is
achieved using a large-batch method that is warm-started with a small-batch
method". This suggests that *dynamic sampling*, where the batch size is increased
gradually as the iteration progresses (Byrd 2012, Friedlander 2012), might
actually work. And in such situations, do we also anneal the learning rate? Or
keep it constant?

### Conclusion
This past month was thoroughly enjoyable. I've previously been plying through
computer vision papers and implementing papers, collecting and cleaning data and
building models and attempting to sell some products. I've been introduced to an
entirely new world of speeding up Deep Learning training and in the process,
understood a lot more about Deep Learning. And even as I say this, I still feel
like I haven't understood Deep Learning. There are just so many variables to it
and I would like to analyze it from a more theoretical perspective.


