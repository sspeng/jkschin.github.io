---
title: Project Euler Update
layout: post
tag: euler
local: 2015-12-27-project-euler-update
---

Just finished question 7 and 8. Relatively easy questions that could be done very quickly in python. However, I decided to do these questions in C as I would like to become better at C.

7 was pretty much very straight forward as it was just a simple sieve with a few for loops. 8 however was slightly more challenging to me. I had a 1000-digit number to manipulate. Obviously, that wasn't going to fit into an unsigned long long, so I had to use some form of string comprehension.

Turns out that string comprehension wasn't that easy in C. Or at least the way I did it was bad. I kinda had to use the memory addresses of each character and then do an offset to access each character. I think there's a smarter way though. I shall explore this more as I do more questions in Project Euler. I'm pretty sure I have to do string comprehension again.

Doing stuff in C really makes me appreciate the wonders of Python. Should I just go back to Python for all Project Euler questions? The answers will come as I do more questions. Till then.
