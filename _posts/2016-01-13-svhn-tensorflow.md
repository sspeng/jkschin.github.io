---
title: SVHN TensorFlow
layout: post
tag: tensorflow
local: 2016-01-13-svhn-tensorflow
---
<h2>Part 1</h2>
In my previous post, Wally TensorFlow, I adapted the code from the MNIST convolutional version. I decided to try out the CIFAR10 one now. This time, I ran it on an openly available data set, which is the <a href="http://ufldl.stanford.edu/housenumbers/">Street View House Numbers</a>.

The intuition for me was to format the data in the exact same format of CIFAR10 images. That just involved a Python script, so it wasn't too difficult. However, it was really hard to visualize how the first image looks like with just numpy arrays. I had to write the images out and do some form of litmus test. While doing this, I realized that it is very important to perhaps give some test samples. For example, in the download site, they could perhaps put sample images based on the indexes. That way, I can generate that picture form my newly arranged format and ensure that it matches. Doing this a few more times would probably give me more confidence that I converted the data set properly.

With a data set in place, The next thing to do was to change the directories of the current CIFAR10 code and make sure that it read from my SVHN data sets. Once that was done, I ran the code. To my dismay, it failed. The dimensions don't match! Something along the lines of indices. As someone totally new to TensorFlow, I wanted to print the values before it failed. That way, I could perhaps figure out what was wrong. However, it's really hard to print values in TensorFlow

I knew there was something wrong with sparse_to_dense. That was where it was bugging out. However, there was no way to print the values because I had to pass a session in. I then realized that in the cifar10_train.py, there's a session there. I traced the code and found that I could just put sess.run(labels) and this would output the labels. It worked! And poof, there was a value of 10 in the array. What?!

<p style="background-color: #e5e5e5">[ 6  6  4  3  6  8  3  3  5  4  1  9  7  5  1  4 10  4  3  1  5  5  1  4  1
  2  1  1  1  7  1  9  1  6  1  3  2  2  4  3  8  5  2  3  2  1  3  5  9  3
  1  7  6  2  1  3  3  7  2  3  2  1  3  1  4  4  2  4  4  1  9  2  5  3  5
  4  4  1  9  5  1  4  5  5  2  1  1 10  8  4  2  6  2  1 10  3  2  2  4  3
  8  2  2  4  1  8  1 10  1  6  6  8  3  2  8  2  3  1  7  6  4  4  6  5  3
  9  1 10]
</p>

I was puzzled. Why would anyone label a 0 as a 10? I decided to try it for the CIFAR10 data set.
<p style="background-color: #e5e5e5">[3 7 1 1 9 1 0 2 4 2 7 9 3 6 4 5 4 5 5 5 7 8 5 9 0 1 2 4 1 7 7 0 4 9 6 3 3
 5 6 7 3 5 1 2 5 5 2 9 1 3 6 8 7 6 0 9 8 6 8 0 6 1 7 5 3 2 8 9 7 1 0 7 0 6
 0 5 2 0 7 6 6 2 5 4 4 3 8 6 0 8 9 5 1 6 9 9 7 9 2 3 1 5 8 9 1 1 5 0 8 1 2
 5 5 6 2 3 4 2 3 4 4 1 6 3 0 5 6 4]
</p>

Look. Not a single 10. There was the problem. How could I have overlooked it? I went to check SVHN's website once again, and there it is, the first line in their Overview. What's the moral of the story? Read everything before downloading blindly. Troubleshooting this wasted a good day. I uploaded my question and answer on <a href="http://stackoverflow.com/questions/34759227/tensorflow-cifar10-example/34763642#34763642">stackoverflow</a>.

I can successfully run it now, but I can't just take the CIFAR10 code as it is. The images in SVHN are already cropped. Almost to the extent whereby further cropping would make them unrecognizable. As such, distorted_inputs has to be edited.

<ol>
	<li>No flipping. We can't expect the net to recognize mirrored images. Unless of course that's your use case.</li>
	<li>No cropping. It's already small enough.</li>
	<li>Yes to whitening. I need to figure out what exactly this does though.</li>
	<li>Yes to adjust brightness.</li>
	<li>Yes to adjust contrast.</li>
	<li>Yes to random rotations in future? With some smart algorithm to fill the background?</li>
</ol>

Nonetheless, it's training right now, and I shall test it tomorrow. Let's hope the results are good! In any case, I brought up random rotations because we might get tilted numbers, depending on the angle the photo was taken. I also chanced upon this paper on <a href="http://arxiv.org/abs/1506.02025">Spatial Transformer Networks</a>. I think SVHN can do really well when we combine this. Quite a few SVHN samples are actually tilted.

I faced quite a few problems, and I would like to solve these problems. Not just for myself, but for others using TensorFlow as well. A few ideas I have in mind now would be:

<ol>
	<li>Could we make a "development mode" for easier debugging? I know that there's tf.InteractiveSession, but is it possible to have a development mode that allows you to print from anywhere in the code?</li>
	<li>TensorFlow needs more examples. For example, <a href="https://www.tensorflow.org/versions/master/api_docs/python/sparse_ops.html#sparse_to_dense">sparse_to_dense</a> has no example inputs and outputs. I had to write my own script to generate some inputs and outputs to give an idea of what's going on. It is true that the explanations are sufficient, but examples are the best way to understand something.</li>
	<li>tf.image.random_rotate would be a great addition. (<a href="https://github.com/tensorflow/tensorflow/issues/781">Posted an issue on GitHub</a>. Another guy had the idea too! In any case, I shall try my best to make a contribution.) Incorporating a Spatial Transformer Networks module would be great too.</li>
</ol>

These are just ideas, that are not in the API yet (I think). I could be very well wrong, but I shall find out along the way.

P.S. I learnt today that there's a <a href="https://google.github.io/styleguide/pyguide.html">Python style guide</a> by Google. I shall follow this from now on.

<h2>Part 2</h2>
Updated on: 14th January 2016

Checked it out just now. 56000 runs. That took quite awhile. Time to test it! I stopped the training and saved a backup of the checkpoint files. I did this because accidentally running "train" again would cause the entire directory to be overwritten. I do not want that to happen. I modified the code in

<p style="background-color: #e5e5e5">svhn_eval.py (equivalent is cifar10.py)</p>

and fired up a terminal. I hit run. 

***Grins and hopes for the best!***

NOOO. IT FAILED. There's an error.

I posted it on stackoverflow. Check it out below. At time of writing, there is an upvote each on Question and Answer. Yay! Glad I helped someone.

<a href="http://stackoverflow.com/questions/34782201/tensorflow-cifar10-cifar10-eval-py-throws-error-compute-status-invalid-argumen/34785645#34785645">http://stackoverflow.com/questions/34782201/tensorflow-cifar10-cifar10-eval-py-throws-error-compute-status-invalid-argumen/34785645#34785645</a>

Yes it works now! Time to run the test set. After about 1 minute...

<p style="background-color: #e5e5e5">/home/samuelchin/svhn/tmp/svhn_train/model.ckpt-56000<br>
2016-01-14 14:35:17.792675: precision @ 1 = 0.933
</p>

WOW! 93.3%. That's really good. I think the distortions really helped to train a very good network. I ran the test set again, just for confirmation. This time, I got different results, but somewhat similar to 0.933. I wondered why this is the case though. Since the net is fixed, and it is deterministic, shouldn't I get the same answer? Yet again another question to answer in future.

I decided to run the trained net on some data that I have. I took some photographs and cropped whatever numbers that were present. There were a total of 29 32x32 images. I labelled the images too. I combined them into a test file, and ran it through the net. 100% accuracy. Really? That's amazing. Some of the images were tilted and slightly affine transformed.

To further prove that the results are correct. I decided to add some error into the test set. I added 1, 2, 3, 5, 10, 15, 20, 25, 28, 29 errors, onto distinct test sets. They gave the respective results! 28/29, 27/29, etc... I guess I can be 99% sure that the net is evaluating the numbers correctly. To be absolutely sure though, I should feed an entire batch, then output the corresponding labels. I was trying to figure out a way to display the images and the labels respectively in TensorBoard. This would be a really really awesome tool. I hope there's such a functionality! In any case, if there isn't, I need to try and print out the values onto the console.

I guess I have successfully used the SVHN data set on the CIFAR10 model. It worked out pretty well! As I mentioned above, perhaps I should implement a Spatial Transformer Module. I will definitely try this soon.

The next thing that I would have to do too, is to use CIFAR10 as a model and code the entire structure by myself from scratch. As with all of my posts, I would like to conclude with some stuff that I believe would be useful. Stuff that I would work on.

<ol>
	<li>Converting all images in a directory into a bin file for testing. I had to write my own function to do that. But then again, there's TFRecord for us to use. CIFAR10 only uses a bin file because...? I'm not sure why too, maybe TFRecord is pretty new.</li>
	<li>Find a way to print out the probabilities of the predicted label. Or even find a way to label the test images and display it on TensorBoard.</li>
	<li>Build my own model from scratch for a Kaggle problem!</li>
</ol>


