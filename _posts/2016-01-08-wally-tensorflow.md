---
title: Wally TensorFlow
layout: post
tag: tensorflow
local: 2016-01-08-wally-tensorflow
---

Before diving into Wally, I tried out the basic <a href="https://www.tensorflow.org/versions/master/tutorials/index.html">TensorFlow tutorials</a> I haven't gone through all the tutorials yet, but did those most relevant to Computer Vision.

<ol>
	<li>MNIST for ML Beginners</li>
	<li>Deep MNIST for Experts</li>
	<li>TensorFlow Mechanics 101</li>
	<li>Convolutional Neural Networks</li>
</ol>

I will complete the others in time to come, but let me focus on getting good at some parts of TensorFlow first. I really want to try using RNNs to generate music (I'm interested cause I play the piano)!

The code bases that could be relevant to Wally would be CIFAR10 and MNIST convolutional. The CIFAR10 had much more code, so I didn't use that. I thought I would just edit the MNIST code base for 3 channels and 2 classes, for starters. The first thing I had to do was to convert the data into a bytefile that could be parsed into the neural net easily.

The data consists of 15000 background images and 15000 background images overlaid with faces randomly selected from a pool of 15 faces. Training set had 19000 images, validation set had 5000 images, test set had 6000 images.

I explored quite a few ways to combine images into a bytefile. The simplest way is just to use np.savez_compressed. It was really quite troublesome. Wouldn't it be nice if TensorFlow had a function to extract all images in a directory and then compress it into a bytefile with some format. That way, people can easily use their own images to train a neural network! Once I get more familiar with TensorFlow, I shall see what needs contribution and perhaps suggest this add on.

I managed to create the bytefile. Yay! Time to run it in the neural network.

{% highlight python %}
Extracting train_data.npz
180000000
[24000    50    50     3]
Extracting train_labels.npz
Extracting test_data.npz
45000000
[6000   50   50    3]
Extracting test_labels.npz
Tensor("MaxPool:0", shape=(64, 25, 25, 32), dtype=float32)
Tensor("MaxPool_1:0", shape=(64, 13, 13, 64), dtype=float32)

ValueError: Dimensions Dimension(10816) and Dimension(9600) are not compatible
{% endhighlight %}
P.S. Pardon the hideous colour scheme now. I'm just using the default highlight scheme for python. Shall figure a plain black and white one some day.

Oops, I got an error. The dimensions are not compatible. Turns out that the tensor shape was actually off by 1. I did suspect this was the problem but it too me awhile to narrow it down.

This was the problem. It's not a floor per se, it's a round up! 50 // 4 = 12, not 13. For good practice, I think I should use numbers that fit perfectly. Speaking of which, this is actually a prime factorization problem. It's like a simple Project Euler problem...? 50 = 2*5*5. In other words, I can only max pool with a 2x2 window once, since there's only one 2 in this prime factorization.
{%highlight python%}
fc1_weights = tf.Variable(tf.truncated_normal([IMAGE_SIZE // 4 * IMAGE_SIZE // 4 * 64, 512],stddev=0.1,seed=SEED))
{%endhighlight%}

The next error I encountered was a casting problem. A float32 was needed but a float64 was presented. Not a big issue. I simply casted the values to float32. After this, I ran the code. IT WORKED!

{%highlight python%}
Initialized!
Epoch 0.00
Minibatch loss: 11.155, learning rate: 0.010000
Minibatch error: 6.2%
Validation error: 0.0%
Epoch 0.34
Minibatch loss: 10.610, learning rate: 0.010000
Minibatch error: 0.0%
Validation error: 0.0%
{%endhighlight%}

I was shocked. Something is fishy. It's too good to be true. I did the same thing on the test set and got error 0%. I must be doing something wrongly. I mean, fantastic results are good, but it's important to understand why I got such fantastic results. I consulted my peers and they gave me some insights. I found out what was wrong! 

I had only 15 images (the cluttered one where you have to find Wally). I created this data set by first randomly extracting 30000 50x50px background images from the 15 images. 2000 50x50px background images from each image. I was sort of guaranteed unique background images. I then randomly selected 15000 background images that will be overlaid with a face. The faces are selected from the pool of 15 faces. Using this method, I artificially generated 15000 "face images" for training. I had to do this because of the severe lack of positive class images (speaking of which, I should try training a net where I have 300,000 negative classes and 100 positive classes. I wonder how that would work out.). From here, I split the data evenly into the respective training, validation, and test set.

And therein lies the problem. The neural net that I have trained has "seen" all 15 faces during training! A neural net, is somewhat a superb interpolater (correct me if I am wrong). It is thus not surprising that it can identify the faces in the test set! What I should have done, is to split the images into 10 and 5 first. That way, the neural net has only "seen" 10 images, and has to extrapolate what it has learnt in the 10 images and apply it to the other 5. I will make this edit and compare the results again. 

While doing this, I am reminded of the fact that a neural network is mathematically a gradient descent. Therefore, the learning rate is actually extremely important, as we do not want to end up in a local minima. I'm sure there are many good papers out there that talk about the selection and tuning of learning rates, and perhaps by extension, hyperparameters. There's so much more to learn!