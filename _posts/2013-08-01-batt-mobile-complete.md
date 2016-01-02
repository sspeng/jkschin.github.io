---
title: Batt Mobile Complete!
layout: post
tag: gokart
local: 2013-08-01-batt-mobile-complete
---

Here's a teaser of our gokart. IT WORKS.
<div class="video"><iframe width="560" height="315" src="https://www.youtube.com/embed/tpIq8wKM0u4" frameborder="0" allowfullscreen></iframe></div>

<div class="image-wrapper">
<img src="/images/{{page.local}}/1.jpg">
<p class="image-caption">Evidently a last minute hack to make it work.</p>
</div>

<div class="image-wrapper">
<img src="/images/{{page.local}}/2.jpg">
<p class="image-caption">Look at that mess of wires!</p>
</div>

Okay so we fired up our vehicles today but it didn’t start. Andrew was wondering why didn’t it start. And then he realised that we didn’t power the controller. My mistake (Samuel). I totally overlooked the manual. I forgot to connect the 5V wire and the Ground to the controller. OOPS.

<div class="image-wrapper">
<img src="/images/{{page.local}}/3.jpg">
<p class="image-caption">Wow.</p>
</div>

So yes we fixed it and the controller starts! Time for the really messy part. We didn’t really take photos of that because it was basically just trying all permutations of the UVW and ABC wires. Only one combination allows it to turn forward.

So we fiddled around with it for a little and we managed to get the left motor spinning at a really good RPM. However, the right motor was just being retarded and it didn’t wanna spin as fast. We had to troubleshoot the problem.

We realised that the problem is due to the hall effect sensor. One of the wires wasn’t soldered properly.

***LONG TECHNICAL POST COMING UP*** (Skip if you hate nitty gritty)

<div class="image-wrapper">
<img src="/images/{{page.local}}/4.jpg">
<p class="image-caption">A tiny hall sensor.</p>
</div>

Picture of the hall sensor. Not really close up but I think we have a close up pic in our previous post.

Okay so there are actually 3 hall sensors. Brushless DC motors (BLDC in short) actually “fire” in sequence to keep increasing the torque on the motor. They have to be fired at the precise moment. If they are not fired precisely at the right moment, the “firing” can actually slow down the motor. Think of it as pushing a child on the swing. If you don’t push the child on the highest point of the swing, you’re never gonna get him to go higher.

So our motor was actually not spinning as fast. We thought it was due to the firing sequence. As such, we moved the hall sensor to the left/right to find the optimal. However, we could still not achieve the same RPM as the right motor. As such, we decided to test if the hall sensors were soldered properly. It was definitely not the UVW ABC problem as it was spinning forward.

True enough, it was the hall sensor soldering problem. We soldered the B sensor. Well it wasn’t actually working, so the motor was only firing twice instead of thrice, which doesn’t make it as fast (naturally). 

***LONG POST ENDS***

After soldering it, it works!

<div class="image-wrapper">
<img src="/images/{{page.local}}/5.jpg">
<p class="image-caption">Me in the car!</p>
</div>