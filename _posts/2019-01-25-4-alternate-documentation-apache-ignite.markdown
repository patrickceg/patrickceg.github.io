---
layout: post
title:  "4. Apache Ignite, 1 of 2: Documentation in Videos"
date:   2019-01-25 20:30:00
categories: tips
---

This is the first of a two post series on Apache Ignite. This part discusses documentation about the project. [TL;DR](https://en.wikipedia.org/wiki/Wikipedia:Too_long;_didn%27t_read): It's there, but in [YouTube videos](https://www.youtube.com/channel/UChYD3lCEnzHlWioUb2sNgSg)!

(This is my first post in quite a while, as I spent most of the fall looking for information security readings.)

I am evauating [Apache Ignite](https://ignite.apache.org)  for a project. (I will abbreviate to Ignite for the rest of the article.) Ignite is a cluster data storage and processing system, which has some really nice properties:

1. Its initial use is a cache that can be backed by disk
2. The data stored in the cache can be used as an SQL database
3. You can control how to send compute tasks, such that a node with the data locally executes the compute task (The most useful for my project)

That third point is especially useful for my project because most operations on the data are localized for that dataset. In that project's compute, it is rare to process far away batches in the same operation. Therefore, being able to control when to go over the network to another node is very useful. Also, if you're wondering, "cache" seems to now be naming convention from the days of Ignite being a caching layer only. It also supports persistence and has durability settings just like any database. Writing to a "cache" with persistence configured to be on is a database write that will survive shutdown.

Unfortunately, while Ignite looked very good in theory, I was having problems finding documentation. It has a lot of documentation on its official site, but almost all of it tells you about the framework and _how it is designed_, rather than _how to use the framework_. The official Ignite 1.x book also suffers from the same problem. Okay, so I know how the framework is structured, but that doesn't answer:

* How do I structure data for the best performance?
* Which persistence configuration do I use?
* How do I deploy it?

All of those questions were unanswered, and after a week of messing around and reading, I was ready to move on and look for another framework. By looking at the written documentation alone, Ignite looked like an open core project that still needed you to "contact sales" to try. I credit another team member, who found out where all the "how to" documentation was: Gridgain's YouTube channel.

Gridgain is the primary contributor to Ignite, and apparently they use presentations for all of their how-tos. There are collections of videos about all of those questions, like a missing part of the documentation.

There are several guides that I could only find in videos, including:

* Best practices for [processing data streams](https://www.youtube.com/watch?v=Rn-OkQyZQlk) and [loading data into the system](https://www.youtube.com/watch?v=HJyEc9SC2gc)
* Tips on how to [arrange data in a cluster](https://www.youtube.com/watch?v=agi2KTyGeRc)
* Design / development guides: [1](https://www.youtube.com/watch?v=9lQLVv4nJb0) [2](https://www.youtube.com/watch?v=BciVRK9VuS4)

So, lesson learned: Even for a product that isn't visual, you may be able to find videos of how to use it. I usually try to find videos on stuff that is more interactive, including graphical applications, games, phyiscal tools, and robots. However, this was a first for me: to find a software library / server platform that had an entire class of documentation available only as videos.

I plan to figure out a way to work how-tos into the Ignite community's documentation, but I wanted to get this post out first before attempting it. I was never really good at mailing list based communities (preferring message boards, live sessions, or chat), and it looks like Ignite does a lot of communication through a mailing list.

The next post I'll have about Apache Ignite is how to link its caching and database portions together. Specifically, setting up so you can use an IgniteDataStreamer to add data, and use SQL queries with joins to read.  My use case isn't quite as well documented, so I'll put together a code sample to fill in the gap.
