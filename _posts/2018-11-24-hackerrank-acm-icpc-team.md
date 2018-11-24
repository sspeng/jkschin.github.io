---
title: HackerRank: ACM ICPC Team
layout: post
tags: algorithms
local: 2018-11-24-hackerrank-acm-icpc-team
---

Question: https://www.hackerrank.com/challenges/acm-icpc-team/problem

Starting to do HackerRank again. The objective is to do a small problem each
day at least, with the option of spilling over to the next day if it is too
hard.

This question is really simple. N is less than 500, and `500C2` is in the order
of `O(N^2)`. 250000 pairs in the worst case. We can also use bit operations,
which should definitely make things a lot faster. M is less than 500, which
means that for each pair, the counting of the subjects they know should take
`O(M)`. We need to count the number of digits that have value `1` in the binary
string. Given this, the solution can be seen as `O(N^3)` with `N<500`. Turns out
that I had a TLE.

The line that caused a TLE was taking a really long time to compute the number
of digits that have value `1` in the binary string. The native Python method of
`count` was of course the fastest, followed by a simple loop, bit shifts, and
then the method I initially did. More information can be found
[here](https://github.com/jkschin/hackerspace/tree/master/hackerrank/acm-icpc-team).

It makes sense that the native Python `count` is the fastest. [This
SO](https://stackoverflow.com/questions/35855748/whats-the-computational-cost-of-count-operation-on-strings-python)
explains it well. It's written in C!

The lesson learnt here is that native methods should be used as much as
possible. I did that initially, but it was all native methods combined together
in an inefficient manner. I should start writing in C++. Those are the rules of
ICPC after all - guaranteed solvable in C++ but not in Python 2/3.
