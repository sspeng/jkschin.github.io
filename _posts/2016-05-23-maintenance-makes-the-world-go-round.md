---
title: Maintain. Or Rebuild?
layout: post
tag: random
local: 2016-05-23-maintenance-makes-the-world-go-round
---

Recently, I had to revamp <a href="http://www.sutdmountaineering.com">SUTD Mountaineering's website</a>. This is the third time I'm doing this. The first time, I populated all the posts to Tumblr. The second, all to Wordpress. These hosts did not offer much customizability and I didn't like it. As such, I had to bite the bullet and build it from scratch with Ruby on Rails. I wanted the flexibility. I had quite a bit of help from my friend.

Once again, I manually populated all the posts back to the Rails website. I hated doing that. I told myself that this was the last time I will be repopulating a website. Before deciding to repopulate the website manually, I asked myself this question:

1) Can I simply just pull the old posts from the existing Tumblr page and display it on the website in a formatted manner?

2) If so, do I continue adding posts to the Tumblr page?

3) Or do I add future posts to the Rails website?

I didn't like the idea of having content spread over so many places. As such, I decided to just maintain one repository of all content. The Rails website. 

I now see the importance of a database. HTML/CSS is really content independent (correct me if I'm wrong). I should just maintain a database that stores the post data, which I can easily use in future when a major revamp is necessary. Is Rails the best way to keep such a database? From what I heard, the image names stored in the database are hard-coded in the post data. If I were to ever migrate in future, I have to maintain that all images keep their names and perhaps even the path, or change the image paths in the hard-coded post data.

Argh, so much I don't know in web programming. I'm still a noob. Do I really want to pursue more web programming?






