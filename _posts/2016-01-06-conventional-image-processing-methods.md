---
title: Conventional Image Processing Methods
layout: post
tag: tensorflow
local: 2016-01-06-conventional-image-processing-methods
---

I was first introduced to Computer Vision in October 2015. I found it really fascinating. The first project that I did with respect to Computer Vision was: <a href="https://en.wikipedia.org/wiki/Where%27s_Wally%3F">Where's Wally?</a>

<div class="image-wrapper">
<img src="/images/{{page.local}}/1.jpg">
<p class="image-caption">Where's Wally?</p>
</div>

I was new to this field and had to do quite a bit of reading to figure out how to find Wally. I read about Computer Vision and found some promising methods that I could use to find Wally:

<ol>
	<li>SIFT</li>
	<li>SURF</li>
	<li>Template Matching</li>
	<li>Image Gradients</li>
	<li>Canny Edge Detection</li>
	<li>Histogram of Oriented Gradients</li>
	<li>Hough Line Transform</li>
	<li>Hough Circle Transform</li>
	<li>Gabor Filters</li>
</ol>

I experimented with all the methods using Python OpenCV and I found that the best results were using Gabor Filters, followed by Template Matching. I now discuss how I found Wally.

<div class="image-wrapper">
<img src="/images/{{page.local}}/3.jpg">
<p class="image-caption">Gabor Filter</p>
</div>

I thought the best way to approach this problem would be to try and convert human intuition into code. What would I do when I am trying to find Wally manually? Well, I would first look out for his red and white t-shirt. This worked well for simpler images, but in certain images, the only thing visible is his face and maybe a little of his hat. In those pictures, I looked out for his spectacles From this, I conclude that the most defining feature of Wally would be his spectacles. With that, I set out to explore how to construct a spectacles filter.

The simplest solution for a spectacle filter would be to just write a matrix and then surround it with perhaps 1's and 0's manually. That would work, but I would prefer something more theoretically proven. I chanced upon some <a href="http://www.bmva.org/bmvc/2011/proceedings/paper108/paper108.pdf">work</a> on Gabor Annulus' and thought that would be a good idea.

<div class="image-wrapper">
<img src="/images/{{page.local}}/2.jpg">
<p class="image-caption">Gabor Spectacles</p>
</div>

The spectacles alone is insufficient, as we all know that Wally has a certain skin colour. The best way to get an average of his skin colour is to manually sample a pixel in each of the 15 images. However, I didn't do that as it was tedious. I decided to use KMeans-3 to find 3 defining colours, and I just took the middle one to be his defining colour. With that, our face filter is complete!

<div class="image-wrapper">
<img src="/images/{{page.local}}/4.jpg">
<p class="image-caption">15 Samples</p>
</div>

<div class="image-wrapper">
<img src="/images/{{page.local}}/5.jpg">
<p class="image-caption">KMeans 3</p>
</div>

<div class="image-wrapper">
<img src="/images/{{page.local}}/6.jpg">
<p class="image-caption">Face Filters!</p>
</div>

It's now time to slide the face filter over the entire image and find areas where the match is the highest. I used three different metrics (SQDIFF_NORMED, CCOEFF_NORMED, Convolution) and linearly combined the results.

<div class="image-wrapper">
<img src="/images/{{page.local}}/7.jpg">
<p class="image-caption">Results</p>
</div>

Surprisingly, it worked very well! I'm quite impressed by it. However, it's quite manual as it requires hand tuned filters. When the scale of the image changes, the filters have to be changed too, and it's not a guaranteed hit. I've read about how Neural Networks are amazing. I should try it on Wally.





