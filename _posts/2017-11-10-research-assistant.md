---
title: Research Assistant
layout: post
tags: deeplearning
local: 2017-11-10-research-assistant
---

**EDIT on 29th December 2017**. Deep Learning research is moving so quickly. The
idea I had for the paper I was trying to write was [released by
NVIDIA](http://research.nvidia.com/publication/2017-12_High-Resolution-Image-Synthesis)
on December 4th 2017. They probably submitted it for CVPR 2018. Note that I'm
not saying I could have achieved their results because I clearly could not in
the 3 months! The paper's results are really stunning. 

I've worked as an RA for the past 3 months. If I could only say one thing that
I learnt, it would be that reproducibility in machine learning is really
difficult and the devil lies in the details.

I was interested in computer vision research as I've been doing it for the past
2 years and thought it would be a good time to write a paper on it. I
explored various topics available and found sort of a niche where there were
publications on it but not too many people were looking at it. My main
considerations were to choose a topic that could potentially become a paper
within 3 months. We started with the idea of multi-view inpainting using GANs.
It was hard because I have no prior experience in 3D pipelines. If we did that,
I would have to spend most of my time learning the 3D pipelines. I discussed
this with my advisor and made a suggestion to pivot to the single view case but
to try and improve on existing state-of-the-art methods. He supported the idea
and I began exploring the latest CVPR 2016/2017 papers on it. Turns out, there
were only 3 seminal papers so gaining a thorough understanding of each paper
wasn't that hard. Or so I thought.

I started off with the paper by Pathak et al. (CVPR 2016). It was the standard
encoder decoder pipeline, with the only exception of a channel-wise fully
connected layer that greatly reduces the amount of connections, and hence
reduces memory and computation speed, of which memory is the more important
factor. They used a masked L2 loss together with a GAN loss and had lambda to
be 0.999 and 0.001 respectively. Their code was in Torch, something I wasn't
familiar with. I could run their code though so it wasn't too bad.

The next paper was by Yang et al. (CVPR 2017). It models Pathak et al. with the
exception of the architecture having a fully connected layer instead of a
channel-wise fully connected one, and they opted to use ELUs instead of
LeakyReLUs. This made more sense from a coding perspective (it's a lot easier to
code this!). I wasn't sure that the channel-wise architecture actually had a
significant effect as well. Following that, they opted to use this optimization
technique that compares neural patches. This was a pretty neat idea I must say.

The next paper was by Yeh et al. (CVPR 2017). It's a simple idea that's pretty
obvious in my opinion. Use a standard DCGAN, optimize the random vector such
that it produces the closest image, and then inpaint it. It was a simple idea
and Brandon Amos wrote a really [great blog
post](http://bamos.github.io/2016/08/09/deep-completion/) about it. 

Those are the papers in general. I won't be talking much about how we are doing
it as it's not been published yet. I'd like to talk more about my learning
points:

1. Always start the pipeline of any architecture from the front. I assumed the
   front pipeline will work but towards the end when I was testing it, it
   failed.  If the front already failed, it might change your architecture
   decisions further down the line.
2. Be very careful with GANs and WGANs. I managed to get some very good results
   with a wrong implementation of WGAN. When I used the correct implementation,
   it didn't work. I'd have to explore more of why this is the case.
3. Always start with replicating the papers from scratch, instead of using their
   code, if time permits. This gives you a great understanding of their paper.
   I'd be replicating more papers in my free time from now.
4. Always run some evaluation images during training and display them using
   TensorBoard (speaking of which I haven't found a nice way to code a wrapper
   for this). I actually overfit quite a few of my models without realizing it.
5. Image augmentation is extremely important. Especially when your dataset is
   really small.

Once again, great learning experience overall and looking forward to writing
more TensorFlow code!

