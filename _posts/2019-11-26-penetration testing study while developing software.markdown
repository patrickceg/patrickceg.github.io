---
layout: post
title:  "Opinion: Penetration Testing Study while Developing Software"
date:   2019-11-26 21:00:00
categories: update
---

[TL;DR](https://en.wikipedia.org/wiki/Wikipedia:Too_long;_didn%27t_read): I've been busy playing with [Penetration Testing with Kali Linux](https://www.offensive-security.com/pwk-oscp/) for over a year

I haven't updated this site in a while because I've been working on penetration testing for almost exactly a year. It was November 2018 when I initially looked at [Offensive Security's documentation](https://www.offensive-security.com/pwk-oscp/) and signed up for the PWK course. So far, I had two failed exam attempts. Reflecting over the two failed attempts, I learned how different penetration testing is compared to software development.

I'll place my thoughts on taking the PWK couse and doing hackathons while working full-time as a software developer.

## The OSCP Course

I'll break down some of my OSCP experiences.

### Positive

I respect the PWK / OSCP course and certification. It reminds me of the meme "Tough but Fair" (I'll leave the link out because a lot of the references were risky). I found the course material and exam unforgiving, but I can rationalize why everything is there:

* The pricing is comparable to studying and repeated fails of CompTIA courses including [Security+](https://www.comptia.org/certifications/security)
* It's a good option for people who really hate or for some reason cannot tolerate at all the traditional exam type
* The lab and exam puzzles look a lot more like real configuration errors: the puzzles to solve the boxes aren't too unrealistic. As a back-end developer, some of the configuration vulnerabilities are even familiar...

### Negative

There's a few things that can definitly be improved with the course:

* It's starting to show its age: The techniques are still very valid (i.e. the OWASP Top Ten from [2010](https://www.owasp.org/index.php/Category:OWASP_Top_Ten_Project#tab=OWASP_Top_10_for_2010) isn't all that different from the [version in development](https://github.com/OWASP/Top10/blob/master/2017/en/0x11-t10.md)), but the tools are dated. Part of the course uses abandoned tools.
* Inability to pause the lab time really hurts part-time study like mine: I use most of my cycles to do stuff at work, so I only have an hour or so per day (especially since pushing through the weekends degrades my physical and mental health). That means I burn a lot of the course timer either at work or resting.
* The course has a massive [difficulty spike](https://tvtropes.org/pmwiki/pmwiki.php/Main/DifficultySpike): after it teaches you the tools, you're off to roam free on to the lab computers with no hand-holding.
  - I mentioned the video game terminology because it really does relate: It's like some older fighting video games where you have the button mahsing players at one end of the spectrum and the people who figured out every single move at the other side, with a big gap in the middle. That said, I'm _not_ saying to make the exam easier: just add a stepping stone between the basics lessons and the free-range part of the course.
  - A possibility to address this would be to break the course in two or three, because that's pretty much how I saw it.
    * "Part 1" of the course is where you're learning about tools by pointing them at a machine you have complete control over and can therefore debug from the target side.
    * "Part 2" is when you smash up the labs.
    * A "Part 1.5" I'd recommend would be a little gauntlet of several "this machine is vunerable to ... get an administrator's command prompt or root shell on it". This part doesn't exist in the OSCP, although I thank my OWASP contacts for showing me [Pentesterlab](https://www.pentesterlab.com/) which does fill that gap.

## My Thoughts

So aside from failing spectacularly, here's what I think about penetration testing and the idea of taking this type of course:

* Messing up an attack is unforgiving
  - A lot of messed up attacks including kernel exploits cause the server to crash. Therefore, if you make a mistake or choose the wrong attack / parameters, you can't retry immediately.
  - Another thing I noticed is it's much harder to know if you configured a tool properly before diving in. In healthy software projects, there's unit test and static analysis that mentions something may not be right in seconds, rather than you (or customers!) finding out hours later.
  - Doing those attacks feels a more like working with a messy codebase, where you have to prepare too much to do a simple thing. You triple-check all the command line arguments: Contrast that to working on a software project based off [fail faster](https://www.youtube.com/watch?v=rDjrOaoHz9s)  where you can experiment by starting with experiments that may be wrong, allowing the warnings to guide you to the solution.
* The rigid timelines of the course (the lab time in 1 month increments and exam forced 90 days after lab time ends) really made me feel like I was on rails. I definitely overstressed the idea of staying on schedule, and when that started to slip, all the usual stress and whatnot came in to [livelock](https://en.wikipedia.org/wiki/Deadlock#Livelock) my brain :P
* It's helped me become a better developer
  - To learn penetration testing, I needed to elevate my knowledge of operations and how networks and servers work (as a back-end dev, I didn't learn much more about the application end). The knowledge is useful in debugging as well.
  - Now that I know what kind of tools the attackers have, it's a lot easier to explain the significance of bugs. Instead of talking about the abstract "hacker", I can specifically tell the team which tools could mess up our app if we left it insecure. Similarly, I have ideas on adversarial unit tests that can exercise parts of the code as if the app was under attack.

## Tips

* Be very careful considering this course if you have a full-time job. As mentioned, the attack tools are pretty unforgiving to errors, so you will be a lot slower if you are prone to making mistakes (after a day's work).
* Don't think of the certification as your only way in to the field: a good example is how most software developers (me included) don't have a certification.
* Beware that difficulty spike! If you come in to the course only knowing basic network testing like I did, you'll burn a whole lot of lab time poking around with the basic scans instead of studying the lab machines in detail.
  - That spike now convinced me that you really do want to at least go through tutorials of hacking [Vulnhub](https://www.vulnhub.com/) or [Hack The Box](https://www.hackthebox.eu/) VMs before signing up for OSCP lab time.

Note there's a constant stream of OSCP tips (for example the [Reddit community](https://www.reddit.com/r/oscp)), so definitely at the opinions of other people who have passed or struggled.

## What's next for me

I'm going right back to volunteering in OWASP to try networking (the human type more than the computer type) and just messing around with tech again. I'll get used to Vulnub, Hack The Box, and Pentestlab before doing another PWK lab extension + OSCP exam.
