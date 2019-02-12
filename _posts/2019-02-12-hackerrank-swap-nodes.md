---
title: ! "HackerRank: Swap Nodes"
layout: post
tags: algorithms
local: 2019-02-12-hackerrank-swap-nodes
---

This question was pretty involved. I never knew that implementing a
tree was this hard in C++. In addition to that, I refreshed my knowledge on the
various traversals and realized that I've totally forgotten about each type
of traversal. Once you get the tree data structure right, the question wasn't
really that hard. There are only 100 queries at best and thus you could easily
just swap everything even though it's repetitive. An additional
optimization that could be done here would be to find the common divisors
and do some pruning. For example, if I'm given depth 2 and 4 to swap, then I
can easily infer that depth 4, 8, 12, etc. doesn't need to be swapped and thus
this could be pruned, potentially saving swaps but still incurring the cost of
traversal as you have to reach the leaf nodes. I guess another alternative would
be storing the entire tree in a map with the depth as the key for instant access
to the nodes that need to be swapped. That way, you save on the traversal.
Depending on the problem scale, various optimizations can be applied. This was a
good starter question on trees!.

Code [here](https://github.com/jkschin/hackerspace/blob/master/hackerrank/swapnodes/swapnodes.cpp).
