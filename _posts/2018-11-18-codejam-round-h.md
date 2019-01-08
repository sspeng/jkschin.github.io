---
title: Google Code Jam Round H
layout: post
tags: algorithms
local: 2018-11-18-codejam-round-h
---

It's the last Code Jam of the year. I wanted to take part in the previous ones
but didn't make the time to do it. At least I managed to do the last one.
Performance was really bad though, only managed to finish the first 2
questions - in a bad timing too. My overall rank was 881 out of 1765
participants. Around 50 percentile. Gotta keep improving! 

The first question was pretty simple. I got the idea in 10 minutes, but had
trouble coding the double for loop to find matching strings and prune the
remaining forbidden prefixes to prevent double counting. Ended up finishing the
question in 1 hour 16 minutes. Disappointing!

The second question was real simple too. The sliding window solution immediately
came to mind, but I found it hard to convince myself that every window is a
valid window. I was trying to find edge cases where certain windows won't be
valid, and hence we have to prune them. In any case, I was lazy and went for the
simple Python solution. Iterate through the list and compute the sum of the
window at every step. This is an `O(n^2)` solution and I knew it, and had
suspicion that I would fail the large test case because it specifically
mentioned 1 case being extremely large. I submitted the small case, got it all
right, and downloaded the large one. I had 8 minutes to submit the answer and my
code took forever to run. At this point in time, I realized that I had to
implement the sliding window solution. The race was on as I only had one chance
to submit the large solution. I blitzed through the implementation, and used my
previous input and output as a checker. I used `diff` to spot the differences. I
had off by one errors and exceptions thrown because I went out of the range of
the list, and had to experiment and think harder on what the right indexes are.
I finally got it right, and the `diff` was totally blank. I submitted the
solution with 30 seconds to spare. A real close shave, but a very exciting Code
Jam experience. At this point in time, I had 40 minutes left to finish Question
C. I saw that it was some kind of combinatorics problem, and I knew I wouldn't
be able to solve it in time. Now that Code Jam is over, it's time to review
Question C and learn from it.
