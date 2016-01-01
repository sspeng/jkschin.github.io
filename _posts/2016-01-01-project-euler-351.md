---
title: Project Euler 351
layout: post
tag: euler, euler351
local: 2016-01-01-project-euler-351
---

<a href="https://projecteuler.net/problem=4">Question 351</a>

This is a back post as well. I finished 351 before starting this website. 351 has a difficulty of 25%, so I guess I will talk about it.

The first part of the problem is to figure out what mathematical equation actually models such a situation. I won't talk about what equation it is!

Once you find the equation, you then have to find an efficient way to compute all the solutions. I was using Python for this and it was really slow. I discovered a library called Numba and it sped up the computation really quickly.

Even with Numba, it wasn't that fast. There are some properties that can be sped up. Of course, I didn't figure this out myself. I just knew it was too slow and Googled for a solution to speed it up. Eventually, I found a solution that works! The code gives the answer in 3 seconds.

Through this exercise, I start to realise that O(nlog(n)) is actually not that fast after all. I used to think that it was fast, but when deal with big numbers, it actually is really slow. Looks like we have to try and solve Project Euler problems in maximum O(n) or O(nlog(log(n))).