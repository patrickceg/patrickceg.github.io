---
layout: post
title:  "4. Alternate Documentation in Videos (Apache Ignite, 1 of 2)"
date:   2019-01-23 00:00:00
categories: tips
---

This is the first of a two post series on Apache Ignite. Its subject is regarding the project's weird state of documentation at the time of writing. [TL;DR](https://en.wikipedia.org/wiki/Wikipedia:Too_long;_didn%27t_read): It's there, but in [YouTube videos](https://www.youtube.com/channel/UChYD3lCEnzHlWioUb2sNgSg)!

(This is my first post in quite a while, as I spent most of the fall looking for information security readings.)

Public domain knowledge is amazing. You get to benefit from knowledge of years of other peoples' experience, whether it be from creative commons books, news articles, or in case I'm discussing here, open source software (OSS). OSS often allows you to use a tool and modify it to your liking completely for free, and depending on the license, you can even use it to pay the bills. However, one of the points against OSS is the documentation (actually, a lot of tech suffers from this - open or closed source).

The OSS I was looking at and face-palming at the documentation for was [Apache Ignite](https://ignite.apache.org) (will abbreviate to Ignite for the rest of the article). Ignite is a cluster data storage and processing system, which has some really nice properties:

1. Its initial use is a cache that can be backed by disk
2. The data stored in the cache can be used as an SQL database
3. You can control how to send compute tasks, such that a node with the data locally executes the compute task (The most useful for my project)

I am evaluating Ignite for a big data project, and that third point is especially useful because most operations on the data was localized. You'd do most of the compute on a particular batch of data, or perhaps neighbouring batches, and it was very rare to process far away batches in the same operation. Therefore, being able to control when to go over the network to another node is very useful.

Unfortunately, while Ignite looked very good in theory, I was having problems finding documentation. It has a lot of documentation on its official site, but almost all of it tells you about the framework and _how it is designed_, rather than _how to use the framework_. I even have the older Ignite official book, and that plus the web site documentation still leave me asking questions about how to do things:

* How do I structure data for the best performance?
* Which persistence configuration do I use?
* How do I deploy it?

All of those questions were unanswered, and after a week of messing around and reading, I was ready to move on and look for another framework. By looking at the written documentation alone, it looked like another open core software product that was open just because, and to actually try it, you had to "contact sales". ...then another team member found out where all the "how to" documentation was: Gridgain's YouTube channel.
Gridgain is the primary contributor to Ignite, and apparently they use presentations for all of their how-tos. There are collections of videos about all of those questions, like a missing part of the documentation.

There are several guides that I could only find in videos, including:

* Best practices for [processing data streams](https://www.youtube.com/watch?v=Rn-OkQyZQlk) and [loading data into the system](https://www.youtube.com/watch?v=HJyEc9SC2gc)
* Tips on how to [arrange data in a cluster](https://www.youtube.com/watch?v=agi2KTyGeRc)
* Design / development guides: [1](https://www.youtube.com/watch?v=9lQLVv4nJb0) [2](https://www.youtube.com/watch?v=BciVRK9VuS4)

So, lesson learned: Even for a software product that isn't all about a user interface, you may be able to find videos of how to use it. I usually try to find videos on stuff that is more interactive, including graphical applications, games, phyiscal tools, and robots. However, this was a first for me: to find a software library / server platform that had an entire class of documentation available only as videos.

Hopefully I can figure out a way to contact the Ignite community about this bit that may turn people away from the framework. I was never really good at mailing list based communities (preferring message boards, live sessions, or chat), and it looks like Ignite is one of those.

The next post I'll have about Apache Ignite is how to link its caching and database portions together. The fact and examples are there, but for there's an example missing. I'll create a basic Java project that uses Ignite, and link it as my second post about Ignite.



