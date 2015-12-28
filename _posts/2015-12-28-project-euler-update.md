---
title: Project Euler Update. Question 9 and 10.
layout: post
tag: euler
local: 2015-12-28-project-euler-update
---

9 was a relatively interesting question on pythagorean triplets. An example of a pythogorean triplet would be 3^2 + 4^2 = 5^2. There are actually many more.

Turns out that we can use Euclid's formula to find out the variables a, b and c. These variables are a function of m and n, where m > n. This problem then becomes a simple iteration over m and n, with a complexity of O(n^2). Learnt something new today. We could also use the primitive triplets method and then multiply them by a factor of k, but I think it's a lot of trouble to implement that. I'm not sure if that would be faster too, so we will just leave it at the naive implementation as it meets our objectives.

10 was relatively simple. It's just the sum of primes so I could actually use code from Question 7. I should perhaps start thinking about writing/downloading C libraries where there are sieve methods already implemented. Or should I just switch back to Python?

