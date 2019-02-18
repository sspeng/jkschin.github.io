---
title: ! "HackerRank: Frequency Queries"
layout: post
tags: algorithms
local: 2019-02-18-hackerrank-freq-queries
---

Seemed easy at the start as I misread query 3. I read it as if there exists at
least one of this number in the data structure. I tried coding this immediately
without writing it on paper, and was stuck pretty quickly or found out I was
heading down in the wrong direction pretty quickly. I can see why you should
never code immediately and write the solution out on a piece of paper first. I
took a step back, wrote it on paper, and the code was 95% correct. The
remaining 5% was syntax errors, and a section where I failed some test cases
because I forgot to delete the element from the `unordered_map` after it
reaches 0. It was clear that I needed to maintain 2 dictionaries from the start
so this was good.

Code [here](https://github.com/jkschin/hackerspace/blob/55ec1ab961c26bbccf22c28fd6a7b382f7f13589/hackerrank/frequency-queries/freqqueries.cpp).
