---
title: Project Euler 100
layout: post
tag: euler, euler100
local: 2015-12-29-project-euler-100
---

<a href="https://projecteuler.net/problem=100">Question 100</a>

I decided to skip the first few questions as it's just tedious implementation. I jumped to 100 and thought it was interesting, so why not?

It turned out to be a pretty tough problem for me because I haven't seen such problems before. My intuition initially was to simply do a binary search for each n and see which numbers hit probability = 0.5. That didn't work too well because of floating point issues. A C double only holds up to 15 digits so precision was affected.

I then decided to multiply the numbers and then do a comparison. That didn't work well either as an unsigned long long is 64 bits long. Multiplying a trillion with another trillion is of order 10^24. There was overflow. We could of course just use python but that would slow the code down a great deal, and it did.

I searched for techniques and then I stumbled upon Diophantine Equations and Pell Equation. They have a really nice form and there's a recursion to it as well. That way, we can easily generate the next number above a trillion, as the numbers increase very quickly. Without revealing too much of the answer, I will just put my working below.

The code ran instantly for a trillion! Amazing how some math can reduce the problem by orders of magnitude. I really need to learn more of this. Feels good to be writing some math again!

<img src="/images/{{page.local}}/1.jpg">