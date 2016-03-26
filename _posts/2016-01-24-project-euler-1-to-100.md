---
title: Project Euler 1 to 100
layout: post
tag: euler
local: 2016-01-24-project-euler-1-to-100
---

I decided to create this post because I thought it would be extremely inconvenient to create a new post whenever I finish a few problems. I think I will just lump everything into a gigantic post for 1 to 100, since they are relatively trivial problems. The headers are arranged in numerical order.

###<a href="https://projecteuler.net/problem=12">Problem 12</a>
**Solved on 24th January 2016.** Nothing too fanciful. 7.3 seconds run time. Extremely sub optimal but I just wanted to get the answer. The trick to this question is basically to not brute force. That would take you more than a minute for sure.

###<a href="https://projecteuler.net/problem=18">Problem 18</a>
**Solved on 24th January 2016.** As the question suggests, you can't brute force it. Or rather, you can, but Problem 67 will not allow you to. An approach to consider would be: How can I reduce the problem? For example, try the case of a triangle with 4 rows. Using the answer from 4 rows, how can I get the answer for 5 rows?

###<a href="https://projecteuler.net/problem=19">Problem 19</a>
**Solved on 25th January 2016.** I don't know if you call this cheating, but I used a Python library. Use Python whenever possible, and C for super speed!

###<a href="https://projecteuler.net/problem=20">Problem 20</a>
**Solved on 24th January 2016.** A simple Python script.

###<a href="https://projecteuler.net/problem=21">Problem 21</a>
**Solved on 25th January 2016.** Wasn't that hard. A simple python script. But I tried to write everything in a single line. I could for some parts, but I decided to use a Try Except clause, and that can't be golfed. Other than that, it would have made a single line.

###<a href="https://projecteuler.net/problem=22">Problem 22</a>
**Solved on 25th January 2016.** I thought the part on trying to find a mapping from 1=a, 2=b, etc was interesting. I mean you could write code to generate a dictionary, but I found out from stackoverflow that you can use ord() to do something smart!

###<a href="https://projecteuler.net/problem=23">Problem 23</a>
**Solved on 25th January 2016.** I wrote a Python script that ran in 38 seconds. Still under the minute requirement! I think C would be instantaneous though. This problem was quite confusing initially. It took me some time to understand what it was asking.

###<a href="https://projecteuler.net/problem=24">Problem 24</a>
**Solved on 24th January 2016.** Pen and paper will do the trick! Counting from 0th number might be a good idea ;)

###<a href="https://projecteuler.net/problem=25">Problem 25</a>
**Solved on 24th January 2016.** A simple Python script.

###<a href="https://projecteuler.net/problem=26">Problem 26</a>
**Solved on 25th January 2016.** Haha this was funny. I saw something similar before. In fact, it is <a href="https://projecteuler.net/problem=358">Problem 358</a>! Took me a few seconds to solve it. 

###<a href="https://projecteuler.net/problem=27">Problem 27</a>
**Solved on 21st March 2016.** This got me stumped for awhile. Seems complicated at first but brute force does the trick. I think brute force is the only method though.

###<a href="https://projecteuler.net/problem=28">Problem 28</a>
**Solved on 21st March 2016.** You can do it by hand with a simple calculator! Well okay it's tedious with a calculator so just write some simple Python code.

###<a href="https://projecteuler.net/problem=29">Problem 29</a>
**Solved on 10th March 2016.** An elegant solution to this is tedious. A simple brute force does it in under 0.5 seconds.

###<a href="https://projecteuler.net/problem=30">Problem 30</a>
**Solved on 22nd March 2016.** Find the upper bound of your search and you're done! After all, there's a divergence after a certain number.

###<a href="https://projecteuler.net/problem=31">Problem 31</a>
**Solved on 23rd March 2016.** Did a depth first search initially, but found out from forums that dynamic programming is a better solution. I ended up implementing a dynamic programming version. I should learn how to decompose problems and identify potential DP problems.

###<a href="https://projecteuler.net/problem=32">Problem 32</a>
**Solved on 24th March 2016.** I need to get into the habit of having the entire program in my head before going out to code. I should try and get the answer in 1 attempt. It's not very good if I hack out something and then submit the answer on Project Euler, only to find out it is wrong. I then have to go back to thinking about what went wrong. For this example, I missed out an additional condition, which caused the answer to be wrong. Such training is extremely applicable for real world situations as more often than not, we don't have the "answer". Nonetheless, this is a pretty simple problem!

###<a href="https://projecteuler.net/problem=33">Problem 33</a>
**Solved on 25th March 2016.** Nothing too difficult. 

###<a href="https://projecteuler.net/problem=34">Problem 34</a>
**Solved on 25th March 2016.** I started timing myself. I took 21 minutes 0 seconds to solve this. I really need to work on speed! The critical path was finding the upper bound. I made a mistake in my factorial function too. So that wasted some time as well.

###<a href="https://projecteuler.net/problem=35">Problem 35</a>
**Solved on 25th March 2016.** 8 minutes 42 seconds. I wrote some helper functions before, so this was relatively simple. It was just a matter of hacking some logic together. It's not exactly efficient algorithmically, as I don't remove primes after finding a set of circular primes. I don't exactly save a lot if I do this either. 

Let's think about it. If there's a 100-digit prime that is circular, the worst case is that I check this 99 extra times, and in each check, it's essentially an O(1) look up done 100 times. For this prime, I will then check 10000 times in my implementation. If I do some optimization, I will only have to check 100 times. It's not worth the effort as the critical path here is really generating the primes. Look ups are almost free. Therefore, why optimize unnecessarily? Let's save it for the tougher problems ;)

###<a href="https://projecteuler.net/problem=36">Problem 36</a>
**Solved on 25th March 2016.** 3 minutes 51 seconds. A simple check_palindrome function was written. I shall add it to my repository of functions that are useful. I should perhaps write a README for all the functions.

###<a href="https://projecteuler.net/problem=37">Problem 37</a>
**Solved on 25th March 2016.** Trivial. I didn't really time it cause I didn't think I would take more than 5 minutes. Made some careless mistakes initially, but I spotted them quickly.

###<a href="https://projecteuler.net/problem=38">Problem 38</a>
**Solved on 25th March 2016.** Trivial. I didn't understand the question properly. Ended up submitting the wrong value for this. It should have been the "pandigital number", rather than the number that results in the pandigital number. I submitted the latter initially. 

###<a href="https://projecteuler.net/problem=39">Problem 39</a>
**Solved on 25th March 2016.** Ah. Slightly challenging problem. I didn't time this because I thought it was simple math. Turns out it was indeed simple math with lots of catch cases. I guess I learnt how to properly write a function with lots of IF statements. I thought I would do it under 5 minutes but I think I ended up taking 20 minutes for this. 

###<a href="https://projecteuler.net/problem=40">Problem 40</a>
**Solved on 25th March 2016.** Trivial. Once again, I read the question wrongly. I ended up adding instead of multiplying. After realising that error, I changed it to *= and it's done!

###<a href="https://projecteuler.net/problem=41">Problem 41</a>
**Solved on 26th March 2016.** I took approximately 10 minutes. Another pandigital problem. It's simply just coming up with a function to check if a number is pandigital from 1 to n, and then checking if it's a prime.

###<a href="https://projecteuler.net/problem=42">Problem 42</a>
**Solved on 26th March 2016.** I took approximately 10 minutes. It wasn't that hard.

###<a href="https://projecteuler.net/problem=43">Problem 43</a>
**Solved on 26th March 2016.** I took approximately 10 minutes. And this is my 50th question solved! I didn't know solving 50 questions puts you into top 6.25% of Project Euler members. I think many people are inactive. The function to check divisibility is simple. I initially iterated all pandigital numbers from 1,000,000,000 to 9,999,999,999. I already had a pandigital number check function, so I simply used it again. It was extremely inefficient.

Why check a number when I can just permute from 0123456789? I did that. It solved in 3.3 seconds. Compared to something along the lines of more than a minute.

###<a href="https://projecteuler.net/problem=67">Problem 67</a>
**Solved on 24th January 2016.** Identical to problem 18. Only difference is that it has a lot more rows. Therefore, you definitely can't brute force this. 

###<a href="https://projecteuler.net/problem=98">Problem 98</a>
**Solved on 20th February 2016.** Seems intimidating at first, since it's rated 35% difficulty. It wasn't that bad after all There are very few anagrams in the first place. Once you find the anagrams, it's a matter of permuting potential substitutions.

###<a href="https://projecteuler.net/problem=99">Problem 99</a>
**Solved on 14th February 2016.** Logarithms are the key!
