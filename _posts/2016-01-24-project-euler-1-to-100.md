---
title: Project Euler 1 to 100
layout: post
tag: euler
local: 2016-01-24-project-euler-1-to-100
---

I decided to create this post because I thought it would be extremely inconvenient to create a new post whenever I finish a few problems. I think I will just lump everything into a gigantic post for 1 to 100, since they are relatively trivial problems. The headers are arranged in numerical order.

#### <a href="https://projecteuler.net/problem=12">Problem 12</a>
**Solved on 24th January 2016.** Nothing too fanciful. 7.3 seconds run time. Extremely sub optimal but I just wanted to get the answer. The trick to this question is basically to not brute force. That would take you more than a minute for sure.

#### <a href="https://projecteuler.net/problem=18">Problem 18</a>
**Solved on 24th January 2016.** As the question suggests, you can't brute force it. Or rather, you can, but Problem 67 will not allow you to. An approach to consider would be: How can I reduce the problem? For example, try the case of a triangle with 4 rows. Using the answer from 4 rows, how can I get the answer for 5 rows?

#### <a href="https://projecteuler.net/problem=19">Problem 19</a>
**Solved on 25th January 2016.** I don't know if you call this cheating, but I used a Python library. Use Python whenever possible, and C for super speed!

#### <a href="https://projecteuler.net/problem=20">Problem 20</a>
**Solved on 24th January 2016.** A simple Python script.

#### <a href="https://projecteuler.net/problem=21">Problem 21</a>
**Solved on 25th January 2016.** Wasn't that hard. A simple python script. But I tried to write everything in a single line. I could for some parts, but I decided to use a Try Except clause, and that can't be golfed. Other than that, it would have made a single line.

#### <a href="https://projecteuler.net/problem=22">Problem 22</a>
**Solved on 25th January 2016.** I thought the part on trying to find a mapping from 1=a, 2=b, etc was interesting. I mean you could write code to generate a dictionary, but I found out from stackoverflow that you can use ord() to do something smart!

#### <a href="https://projecteuler.net/problem=23">Problem 23</a>
**Solved on 25th January 2016.** I wrote a Python script that ran in 38 seconds. Still under the minute requirement! I think C would be instantaneous though. This problem was quite confusing initially. It took me some time to understand what it was asking.

#### <a href="https://projecteuler.net/problem=24">Problem 24</a>
**Solved on 24th January 2016.** Pen and paper will do the trick! Counting from 0th number might be a good idea ;)

#### <a href="https://projecteuler.net/problem=25">Problem 25</a>
**Solved on 24th January 2016.** A simple Python script.

#### <a href="https://projecteuler.net/problem=26">Problem 26</a>
**Solved on 25th January 2016.** Haha this was funny. I saw something similar before. In fact, it is <a href="https://projecteuler.net/problem=358">Problem 358</a>! Took me a few seconds to solve it. 

#### <a href="https://projecteuler.net/problem=27">Problem 27</a>
**Solved on 21st March 2016.** This got me stumped for awhile. Seems complicated at first but brute force does the trick. I think brute force is the only method though.

#### <a href="https://projecteuler.net/problem=28">Problem 28</a>
**Solved on 21st March 2016.** You can do it by hand with a simple calculator! Well okay it's tedious with a calculator so just write some simple Python code.

#### <a href="https://projecteuler.net/problem=29">Problem 29</a>
**Solved on 10th March 2016.** An elegant solution to this is tedious. A simple brute force does it in under 0.5 seconds.

#### <a href="https://projecteuler.net/problem=30">Problem 30</a>
**Solved on 22nd March 2016.** Find the upper bound of your search and you're done! After all, there's a divergence after a certain number.

#### <a href="https://projecteuler.net/problem=31">Problem 31</a>
**Solved on 23rd March 2016.** Did a depth first search initially, but found out from forums that dynamic programming is a better solution. I ended up implementing a dynamic programming version. I should learn how to decompose problems and identify potential DP problems.

#### <a href="https://projecteuler.net/problem=32">Problem 32</a>
**Solved on 24th March 2016.** I need to get into the habit of having the entire program in my head before going out to code. I should try and get the answer in 1 attempt. It's not very good if I hack out something and then submit the answer on Project Euler, only to find out it is wrong. I then have to go back to thinking about what went wrong. For this example, I missed out an additional condition, which caused the answer to be wrong. Such training is extremely applicable for real world situations as more often than not, we don't have the "answer". Nonetheless, this is a pretty simple problem!

#### <a href="https://projecteuler.net/problem=33">Problem 33</a>
**Solved on 25th March 2016.** Nothing too difficult. 

#### <a href="https://projecteuler.net/problem=34">Problem 34</a>
**Solved on 25th March 2016.** I started timing myself. I took 21 minutes 0 seconds to solve this. I really need to work on speed! The critical path was finding the upper bound. I made a mistake in my factorial function too. So that wasted some time as well.

#### <a href="https://projecteuler.net/problem=35">Problem 35</a>
**Solved on 25th March 2016.** 8 minutes 42 seconds. I wrote some helper functions before, so this was relatively simple. It was just a matter of hacking some logic together. It's not exactly efficient algorithmically, as I don't remove primes after finding a set of circular primes. I don't exactly save a lot if I do this either. 

Let's think about it. If there's a 100-digit prime that is circular, the worst case is that I check this 99 extra times, and in each check, it's essentially an O(1) look up done 100 times. For this prime, I will then check 10000 times in my implementation. If I do some optimization, I will only have to check 100 times. It's not worth the effort as the critical path here is really generating the primes. Look ups are almost free. Therefore, why optimize unnecessarily? Let's save it for the tougher problems ;)

#### <a href="https://projecteuler.net/problem=36">Problem 36</a>
**Solved on 25th March 2016.** 3 minutes 51 seconds. A simple check_palindrome function was written. I shall add it to my repository of functions that are useful. I should perhaps write a README for all the functions.

#### <a href="https://projecteuler.net/problem=37">Problem 37</a>
**Solved on 25th March 2016.** Trivial. I didn't really time it cause I didn't think I would take more than 5 minutes. Made some careless mistakes initially, but I spotted them quickly.

#### <a href="https://projecteuler.net/problem=38">Problem 38</a>
**Solved on 25th March 2016.** Trivial. I didn't understand the question properly. Ended up submitting the wrong value for this. It should have been the "pandigital number", rather than the number that results in the pandigital number. I submitted the latter initially. 

#### <a href="https://projecteuler.net/problem=39">Problem 39</a>
**Solved on 25th March 2016.** Ah. Slightly challenging problem. I didn't time this because I thought it was simple math. Turns out it was indeed simple math with lots of catch cases. I guess I learnt how to properly write a function with lots of IF statements. I thought I would do it under 5 minutes but I think I ended up taking 20 minutes for this. 

#### <a href="https://projecteuler.net/problem=40">Problem 40</a>
**Solved on 25th March 2016.** Trivial. Once again, I read the question wrongly. I ended up adding instead of multiplying. After realising that error, I changed it to *= and it's done!

#### <a href="https://projecteuler.net/problem=41">Problem 41</a>
**Solved on 26th March 2016.** I took approximately 10 minutes. Another pandigital problem. It's simply just coming up with a function to check if a number is pandigital from 1 to n, and then checking if it's a prime.

#### <a href="https://projecteuler.net/problem=42">Problem 42</a>
**Solved on 26th March 2016.** I took approximately 10 minutes. It wasn't that hard.

#### <a href="https://projecteuler.net/problem=43">Problem 43</a>
**Solved on 26th March 2016.** I took approximately 10 minutes. And this is my 50th question solved! I didn't know solving 50 questions puts you into top 6.25% of Project Euler members. I think many people are inactive. The function to check divisibility is simple. I initially iterated all pandigital numbers from 1,000,000,000 to 9,999,999,999. I already had a pandigital number check function, so I simply used it again. It was extremely inefficient.

Why check a number when I can just permute from 0123456789? I did that. It solved in 3.3 seconds. Compared to something along the lines of more than a minute.

#### <a href="https://projecteuler.net/problem=44">Problem 44</a>
**Solved on 8th April 2016.** I forgot to time this one.

#### <a href="https://projecteuler.net/problem=45">Problem 45</a>
**Solved on 6th April 2016.** I forgot to time this one.

#### <a href="https://projecteuler.net/problem=46">Problem 46</a>
**Solved on 6th April 2016.** 11 minutes.

#### <a href="https://projecteuler.net/problem=47">Problem 47</a>
**Solved on 6th April 2016.** 4:30.

#### <a href="https://projecteuler.net/problem=48">Problem 48</a>
**Solved on 6th April 2016.** 1:35.

#### <a href="https://projecteuler.net/problem=49">Problem 49</a>
**Solved on 6th April 2016.** 26:54. I took quite awhile for this, so it's blog-worthy. I got stuck at this initially because of the incrementer. You first have to find all the permutations that are primes, and then find a valid value for incrementer. I thought it was as simple as finding all permutations but I misunderstood. 

#### <a href="https://projecteuler.net/problem=50">Problem 50</a>
**Solved on 8th April 2016.** I forgot to time this one. WOOHOO. **50 questions SOLVED!**

#### <a href="https://projecteuler.net/problem=51">Problem 51</a>
**Solved on 15th September 2016.** Oh my. What a long hiatus. The last one I solved was in April 2016. I took an hour for this one. And it wasn't entirely right. But then again, this was a 15% problem and not a simple 5% one. Nonetheless, I should have solved it faster though. Time to brush up my skills. An Euler a day keeps the doctor away!

#### <a href="https://projecteuler.net/problem=52">Problem 52</a>
**Solved on 19th September 2016.** Added a function called count_unique_digits that returns a collections defaultdict. I'm sure this will be helpful in future questions.

#### <a href="https://projecteuler.net/problem=53">Problem 53</a>
**Solved on 19th September 2016.** Simply iterating over all combinations. I wrote my own combinations function as it wasn't that hard. Definitely solved it suboptimally since there are some symmetries in combinations.

#### <a href="https://projecteuler.net/problem=54">Problem 54</a>
**Solved on 26th March 2017.** A ton of hardcoding. There were so many cases to
code up. It was a pretty boring problem. The only hard part was to design a
representation that expresses the various combinations you can get and to decide
a draw. Took about half an hour. 

#### <a href="https://projecteuler.net/problem=55">Problem 55</a>
**Solved on 31st March 2017.** A simple problem. I should work on reading the
question more carefully and solving it the first time. I confused the definition
of a Lychrel number initially and thus spent 3-4 times submitting my answer 
before I got it right. Interesting concept I learnt today, never heard of a 
Lychrel number before.

#### <a href="https://projecteuler.net/problem=67">Problem 67</a>
**Solved on 24th January 2016.** Identical to problem 18. Only difference is that it has a lot more rows. Therefore, you definitely can't brute force this. 

#### <a href="https://projecteuler.net/problem=81">Problem 81</a>
**Solved on 26th March 2017.** Wanted to solve a dynamic programming problem so
I googled for project euler DPs. Came across this and it was pretty easy. Solved
it in about 10 minutes. Was stuck on it for awhile because of a careless mistake
in the initialization of the memoization table.

#### <a href="https://projecteuler.net/problem=82">Problem 82</a>
**Solved on 27th March 2017.** An extension of problem 81. I did it using 2
methods. The first one was using an 80x80x80 array to save all distances between
columns from various starting locations. The second one was recursion, which
somehow using up the entire Python recursion stack. I had to edit the last part
to not make it overflow. The second method was more interesting because I learnt
about the space saving trick we can use for this, which helps if your arrays are
huge.

#### <a href="https://projecteuler.net/problem=83">Problem 83</a>
**Solved on 31st March 2017.** An extension of problem 81. It was a relatively
simple DP. It's quite similar to 82, in the sense that the frontier of
comparison for 82 was 2 columns, but the frontier for comparison for 83 was a
mirrored L. This concept can be expanded to N-dimensional DPs but it's going to
be pretty challenging beyond 3 I think. Would be interesting to try such a
problem in future.

#### <a href="https://projecteuler.net/problem=98">Problem 98</a>
**Solved on 20th February 2016.** Seems intimidating at first, since it's rated 35% difficulty. It wasn't that bad after all There are very few anagrams in the first place. Once you find the anagrams, it's a matter of permuting potential substitutions.

#### <a href="https://projecteuler.net/problem=99">Problem 99</a>
**Solved on 14th February 2016.** Logarithms are the key!
