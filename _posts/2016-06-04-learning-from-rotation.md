---
title: Learning from rotations?
layout: post
tag: deeplearning
local: 2016-06-04-learning-from-rotation
---

Part 1: 4th June 2016

For almost the longest time ever, I had this hypothesis:

Take a video from all perspectives of an object, do some segmentation to extract only the object, train the neural network with these images, and you will get a neural network that can recognize these objects from all orientations.

I seem to have disproved this hypothesis today. Perhaps Spatial Transformer Networks by Jaderberg would really help in this problem. I should try it soon.

Here are the images I tried:

<div class="image-wrapper">
<img src="/images/{{page.local}}/1.jpg">
<p class="image-caption">Koko Krunch</p>
</div>

<div class="image-wrapper">
<img src="/images/{{page.local}}/2.jpg">
<p class="image-caption">Milo</p>
</div>

<div class="image-wrapper">
<img src="/images/{{page.local}}/3.jpg">
<p class="image-caption">Divergence</p>
</div>