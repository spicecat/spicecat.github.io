---
layout: post
title:  "Why Self-hosting is not the Solution"
author: Ta180m
tags: ["Linux", "Society"]
---


So you hate tech giants. You hate Google for removing "don't be evil" from their code of conduct. You hate Microsoft for making Office and not providing a Linux port, or even worse, creating the dreaded Microsoft Losedows. You hate Crapple's walled garden. You hate Amazon. You hate Facebook and Twitter and all the other closed social media sites. But...

These giants have truly permeated through all the aspects of our digital lives. So what's next? What can you do?

Ask this on your favorite closed platform (Reddit, Discord, anyone?) and you'll get a million different testimonials about something called self-hosting. But self-hosting is not a panacea, but in fact the opposite.


## Why?

To put it simply, self-hosting is out of the reach of 99.99% of people. Even the fine self-hosting addicts on Reddit agree that [some things are simply not worth the hassle of self-hosting](https://www.reddit.com/r/selfhosted/comments/le717e/what_would_you_say_is_not_worth_the_trouble_of/), including services as essential as email.

Even if email was easier to self-host, I still wouldn't do it. I'm not a company that can ensure 100% uptime. My server goes down all the time, and I even turn it off at night to save power.

And look at all the posts on [r/selfhosted](https://www.reddit.com/r/selfhosted/top/?t=all): if there's one common theme, it's that self-hosting is a time sink. And that's among people that have some expertise in the area. For 99.99% users, convenience is their highest priority. And self-hosting is the complete opposite of convenience: the purposeful inconvenience (some would call it pain) of setting up and maintaining your own server.

That said, for the small niche of self-hosting enthusiasts, it's fun, thrilling, and reassuring that you're in control. But outside of that, no one's going to self host Gitea when you can just use GitHub with its huge vibrant community, for instance.


## So what now?

![Gitea](/blog/assets/gitea.png)

Well, Gitea actually provides us with a good step in the right direction. Gitea has a feature to *mirror* repositories from GitHub to your self-hosted instance, so it's not too difficult to mirror your entire GitHub user to Gitea. You can self host *and* reap the benefits of GitHub's [network effect](https://en.wikipedia.org/wiki/Network_effect) at the same time. And if your GitHub repos were ever to get taken down like [youtube-dl](https://github.com/github/dmca/pull/8127), you'll still have all the perks of self-hosting a mirror.

What about Matrix (or is it styled [Matrix]? Looks cooler!)? For this example, Matrix allows you to set up self-hosted *homeservers* and *federate* them with the larger Matrix fediverse. While the vast majority of people just register with the default matrix.org like a centralized chat app, there's a healthy number of alternative homeservers out there. And this, here, is a glimpse towards an actually feasible solution to the problem.


## The solution?

A few months ago, there was a big debate about whether it was right for Facebook and Twitter to ban Trump from their platforms. But no one asked whether *these companies should have this power in the first place*. The internet is decentralized and difficult to regulate by nature, so if Trump had instead used something like Matrix, his organization would have just set up their own homeserver that no one else would have any control over. Instead of monoliths ruling over a centralized monopoly, we could have hundreds or thousands of small servers for different companies, groups, and organizations, each with full control over their own server, and let the free market and perfect competition do its magic. (By the way, free markets should be thought of as just a *tool* to get the socially optimal outcome, not a laissez-faire rule to solve everything. Free markets simply don't work in most cases.) With an architecture like this, if one server got too big and abusive, it wouldn't be hard to just move over to another one (Matrix has yet to actually implement this, but it's coming!).

Anyways, traditional self-hosting is quite fun, too, especially seeing how much I've accomplished in two weeks. I can definitely say that self-hosting is not for the faint-of-heart!

