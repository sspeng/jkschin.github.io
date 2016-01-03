---
title: Project Euler 358
layout: post
tag: euler, euler358
local: 2016-01-03-project-euler-358
---
<a href="https://projecteuler.net/problem=358">Question 358</a>
<h2>Part 1</h2>
This question seems relatively simple. It's simply finding a <a href="https://en.wikipedia.org/wiki/Full_reptend_prime">full reptend prime</a>. You can check out the definition in the link. To determine if a number is a reptend prime, it has to be a primitive root modulo n, which in this case, n = 10 since we are working in Base 10. We are also given the first 11 digits, and we can work out some bounds on the prime range that we are searching.

To check if a prime is a primitive root modulo n, we do the <a href="https://en.wikipedia.org/wiki/Primitive_root_modulo_n#Finding_primitive_roots">following</a>.

With this in mind, I had an idea of what functions I had to implement.

<ol>
	<li>Sieve of Eratosthenes (Sieve of Atkins would be great but it's complicated)</li>
	<li>Distinct Prime Factors of N (E.g. 720 is 2^4 * 5 * 9, but we just need 2,5,9)</li>
	<li>Modular Exponentiation</li>
	<li>Cyclic Number Generator</li>
</ol>

I did this in C and faced lots of memory problems. I am not coding memory efficiently. I will need to improve on that.

<h2>Part 2</h2>
It is true that I am not coding memory efficiently. However, my objective is just to get the answer really quickly so I will do a speed memory tradeoff. The reason why I keep getting a segfault, was because I set an upper bound to the number of primes as sqrt(n). I did not allocate enough memory and the code was trying to access unallocated memory. Stupid mistake.

I managed to code the modules successfully. I searched within the bounds that I formulated but I realised that it took too long. In addition to that, the cyclic generator formulates numbers from the front. This meant that a number that's about 700 000 000 will require 700 000 000 iterations before I can see the last 5 digits. That is computationally impossible. Doing that for about 5 million primes in the bound? No way. There must be another solution.

<h2>Part 3</h2>
I found the answer! Turns out that there's a special property that the generator multiplied by the cyclic number itself will get you a number that is all 9s. Using this, I could narrow down the primes easily. I tested them for primitive root modulo n, and then summed up all the digits in the cyclic number. Problem solved!

<div class="image-wrapper">
<img src="/images/{{page.local}}/1.jpg">
<p class="image-caption">My Scrap Paper. The answer is blacked out :P</p>
</div>



