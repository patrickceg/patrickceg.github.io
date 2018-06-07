---
layout: post
title:  "2. Backup Requirements"
date:   2018-06-13 00:00:00
categories: update
---

[TL;DR](https://en.wikipedia.org/wiki/Wikipedia:Too_long;_didn%27t_read): Find out how important your stuff is to you before choosing tools

I recently participated in discussions for backing up projects (during and outside of work) regarding backups. What surprises me in these discussions is how people don't know what they want their backups to survive (requirements). I'll share my thoughts about backup requirements in temrs of what to back up, checking your backups, and then lightly share some other resources about backing your stuff up.

Before I start, I'll want to say thank you for considering backups for your stuff []. It's troubling to hear and read about stories of people, whether at work or personally (1, 2), making attacks more profitable by paying ransoms. FYI, even if you are unprepared enough to pay, there's a 50/50 chance (3) the criminals just take your money without restoring your stuff.

## The wrong stuff to say when starting off

For the majority of cases, these are the wrong questions to start asking when you haven't thought of your backup plan yet.

1. I put everything in (OneDrive / Google Drive / Dropbox): I'm fine
2. What's the most reliable (insert storage type here) for?
3. What's the optimal backup strategy?

For the first statement, thankfully I'm seeing bad advice about this. []

## Knowing what's important to you

Before considering how to back up your stuff, figure out what's important to you. Project management and other business guides call this "risk assessment".

1. What stuff would be detrimental if you lost it?
2. If you lost that thing from #1, how much would it cost you?
3. Can you affort to wait if you need to restore that lost thing?

[]

Most guides I read only consider data, but if part of your life requires you do perform something with a tool (example: Internet access, microphone and camera for podcasts or video streams), you may consider that as something that needs to be 'backed up' as well. I saw a crazy story where there was a murder over a broken headset - I won't link that as most of the sources have lots of video ads, but searching 'gamer murder headset' should pop it up. While this was pointing to another fundamental problem, another question I asked myself was "Why didn't the person have another headset?" I used to be an officer in a video game guild, and I indeed had a spare microphone for voice chat: it was a $3.00 thing, but I figured that I needed to run an event for the guild 3 times a week, and while that's happening, I've moving my head (with a wired headset) around, so it's worth having a spare in case I do excessive nerd rage and break my headset. If you're running some sort of business, you can even consider an entire spare computer.

## What can force you to go to the backups

### Mistakes

[]

### Malware / ransomware attack

[]

### Physical destruction / theft of your stuff

[]

## Testing your backups and spare equipment

If you're taking the time or paying money for backups, you have to make sure that they work (or maybe you can have a scapegoat to blame if they don't work []). Depending on how important your stuff is, the test can be anything between taking a monthly glance and opening a file or two in the backup drive / cloud storage to a full "disaster recovery" test where you pretend your stuff is destoryed and practice retrieving it to get working again. []

## Brief discussion on tools

Once you know how much you're willing to spend (time and money) to have multiples of your stuff, here's some ideas about the common tools.

### Cloud backup and storage

* Free cloud storage: For small things, the free cloud storage deals (usually a few gigabytes) can work as a part of your backup plan if you're on a tight budget. Just be aware that a lot of services may not allow you to roll back if you accidentally delete your stuff or malware destroys it.
* Paid cloud storage: Paid plans can be a one-stop shop for your backups. Usually you get versioned backups and they are off-site, so you can deal with both broken/stolen equipment and malware/accidents destroying your files.

If you decide to go with cloud storage, don't forget to keep your account safe with two-factor authentication and good passwords (example: password managers). If you're ultra paranoid (e.g. for stuff that would damage you for months if you lost it), you can consider using multiple providers or keeping a "the world pretty much ended" type of backup somewhere else in case your backup provider goes out of business.

### External hard drives and USB sticks

The marketing material definitely loves talking about these for backups (Seagate Backup Plus). They can definitely be effective if you use them properly. Some things to keep in mind:

* To protect against power surge or viruses, have more than one and make sure one is unplugged at all times. That way you know there's a safe copy if one of those events wrecks your computer.
* Also have an off-site backup: For fire / flood / theft, either have a cloud backup or keep a third drive somewhere else.

### Digital Versatile Disk, Recordable (DVD-R)

If your data mainly consists of documents, code, or other things that take up small amounts of space, a pack of DVDs can be used to archive your stuff. They're tiny compared to the hard drives, but the 4.7 GB of a DVD-R is still a few million pages of Word documents assuming you didn't go nuts with images in the documents.

I keep a third copy of small but important things including bank statements, receipts, tax return information, etc on DVD. (The second copy is on hard drives.)

### Spare device

If you can't be without a certain computing device (desktop, laptop, phone, etc), you'll want to get a spare. Remember - it doesn't have to be the same device - it's just something that can do the job until you can order a replacement or repair for your main device. For example if you mainly do web browsing, you may be able to survive on your phone for the few days when your desktop is dead. For avid gamers or creators on a budget, your spare machine could be a refurbished laptop.

In addition, you can incorporate your spare device as your backup strategy. Your spare device is also a storage device! When I studied at university, I synced the data between my home laptop and computer in the lab all the time. That was my computer broken / stolen protection, while I had another drive sitting around as the 'accidentally deleted everything' contingency.

### Paper

It's often overlooked, but you're doing backups for someone who can barely turn on their computer, paper is a great way to back up the most important of documents. Paper backups (unless you store them beside a robot flamethrower or something equally exotic) are impervious to malware and crashing: again nice for people who ge their computer messed up every week. Similar to any other physical medium, your paper backups are vulnerable to fires, theft, etc., so keep more paper somewhere else or use it as one part of your strategy.

(There may be some ancient regulatory thing about keeping paper as well, but I won't get in to that.)

## An example backup strategy

[]

### Conclusion: Think about what you want to back up, then compare against your requirement

[]

# References

1. https://www.darkreading.com/endpoint/majority-of-employees-hit-with-ransomware-personally-make-payment/d/d-id/1330267
2. https://irlpodcast.org/episode3/?utm_source=internetcitizen&utm_medium=blog&utm_campaign=irl&utm_content=safetyfirst
3. https://www.theregister.co.uk/2018/03/09/less_than_half_of_ransomware_marks_get_their_files_back/

-- Random name for the example selected from []