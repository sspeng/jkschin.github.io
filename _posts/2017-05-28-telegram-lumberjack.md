---
title: Telegram Lumberjack
layout: post
tags: random 
local: 2017-05-28-telegram-lumberjack
---

Telegram has lots of embedded games recently. My friends are going crazy over
these Telegram games and are scoring ridiculously high scores. I particularly
liked the Lumberjack game and Karate Kido. However, I was nowhere nearly as good
as them. Becoming good requires lots of practice; time which I was not willing
to spend. As a programmer, the natural thing to do is then to code something up!
;) I don't consider this cheating because I told them it's a bot :P

I've been interested in Reinforcement Learning lately. I thought of trying a
Policy Gradient method for this. The only difference is that I don't have to
"wait for the reward at the end" since every step is a reward. Die, or not.
However, before jumping into Reinforcement Learning, I thought of trying the
brute force method first, which is to use simple OpenCV.

Turns out that with some fine tuning, you can get some pretty ridiculous scores,
as seen in the video below. I'm pretty sure I'm hitting the limit of the frame
refresh rate already. 

<iframe width="560" height="315" src="https://www.youtube.com/embed/57EiLQV9W9M"
frameborder="0" allowfullscreen></iframe>

Looks like we won't be needing RL for this, but I'd really like to try one
problem in future. I'll probably be using OpenAI gym for this. A real world
problem is fun but I should start with a more controlled environment.
Immediately jumping into this would require me to take into account latency and
variance of the rate of capture. This affects what an actual step is in RL.

The replies my friends gave were hilarious! I had a good laugh :D
