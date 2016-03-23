---
title: Project Euler 541
layout: post
tag: euler
local: 2016-01-10-project-euler-541
---

<a href="https://projecteuler.net/problem=541">Question 541</a>

<p><a href="https://en.wikipedia.org/wiki/Harmonic_number">Harmonic Number</a></p>
<p><a href="https://en.wikipedia.org/wiki/Stirling_numbers_of_the_first_kind">Stirling Numbers</a></p>
<p><a href="https://en.wikipedia.org/wiki/Wolstenholme%27s_theorem">Wolstenholme's Theorem</a></p>

<h2>Part 1</h2>
I started this problem exactly 7 days ago, on 3rd January 2016. It seemed like a really challenging problem, as they rate at which it was being solved was not rising fast. Take Problem 542 for example, at the time of writing, 35 people have solved it, but 541 has only 49.

I learnt a lot about harmonic numbers while doing 541. I found out about harmonic primes, anharmonic primes, Wolstenholme's Theorem, Stirling Numbers, etc. I honed my "reading math heavy papers" skill. All in all, it was great!

I was reminded of how important it is to study the problem and think about practical ways to solve it. Project Euler always has code that runs under a minute (true until proven otherwise). I forced myself to find an elegant solution.

I chanced upon a paper by 2 people that solves this problem. I studied this paper thoroughly, and implemented the code that generates a particular set of numbers. I had to fine tune the code along the way, as the paper was really obscure about certain things. They contradict each other at times, and I had to resolve them. After much study, I wrote out the final form that I believe to be correct.

Sadly enough, it didn't work. One part is just off. I am supposed to do it in modulo p^2, but their definition puts it in modulo p. Something is missing and I have yet to find it. I thought I could be the top 100 in solving it. It's still achievable, so I will keep working on it next week. Even if it isn't top 100, this is a really hard problem and solving it is a feat in itself for me. After countless sleepless nights and many pieces of paper writing out formulas, I still haven't solved it, but here's the intermediate form. Almost there. The battle is lost, but the war is not over.

P.S. I discussed the problem with peers as well.
<div class="image-wrapper">
<img src="/images/{{page.local}}/1.jpg">
<p class="image-caption">The computation of H is off because it is not in modulo p^2</p>
</div>

<h2>Part 2</h2>
Updated on 13th January 2016.

I am elated that I solved the problem! Within Top 100 was a huge bonus too. We knew we had a problem with the way the new H's were being calculated. My peer was sharp enough to notice it and told me about it. We discussed it and concluded that this method is indeed feasible. I implemented it, with memoization, and the answer came within 12 minutes. He implemented his own version too. We solved it! That's not too bad, considering a brute force would take exponential time and a ton of memory.

There are many ways to skin a cat. The mathematicians in the forums posted about complex mathematical formulas that I would have never known to apply to this problem. As someone from a CS field, I guess I have to use algorithms to make it feasible. Really pleased that this is done! I'm thinking the 10-substrings problem looks interesting. I might try that next. Or, I might try solving sequentially from the start again. Until I am up for another challenge, of course.

