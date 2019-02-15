---
title: ! "HackerRank: Is this BST?"
layout: post
tags: algorithms
local: 2019-02-16-hackerrank-is-this-bst
---

I first implemented this using a stack - it wasn't too hard to get everything
up to speed. It was only until I tried submitting it, that HackerRank did not
allow me to use additional data structures (or perhaps I could but just
didn't know how). The only other way to do this then would be of course the
extremely memory efficient way. I had to think harder about this. It was simple
to traverse and compare each node to see if the criteria fits, but the
insight here was that at every node, there are lower and upper bounds that
the node data must be within or else it is not a valid BST. Building on that,
you simply have to remove the equality function and it implicitly checks
for duplicates. An interesting question and once the insight is obtained, it
shouldn't take too long to code the recursion. The complexity is linear in the
number of nodes.

Code [here](https://github.com/jkschin/hackerspace/blob/master/hackerrank/is-this-BST/is-this-bst.cpp).
