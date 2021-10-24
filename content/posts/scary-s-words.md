---
layout: post
title:  "The Scary S Words"
author: Ta180m
tags: ["Linux"]
---


There are two S words that will plunge any Linux forum into endless debate: systemd and standardization. Just look at what happened on [#archlinux:archlinux.org](https://matrix.to/#/!SEgsRQLScqPxYtucHl:archlinux.org): a lengthly flamewar perpetrated by systemd haters which took through debates about standardization, market share, and gun culture (Yes, this did happen), leading to several bans of longtime regulars. So what makes these two words so divisive and controversial?

Let's start with systemd.

History lesson: In 2004, a Gautemala-born German programmer named Lennart Poettering buys a pair of bluetooth headphones. However, trying to use them with his computer results in a fiery mess. After all, the state of sound on Linux was a catastrophe in the early 2000s, with a jumble of competing standards. So, he sets off to single-handedly rewrite the entire Linux audio stack and bring it into the 21st century so it's more like the idolized Windows audio stack, and somehow, he succeeds! Hello, Polypaudio, err, I meant, PulseAudio: everyone's favorite sound system to bash! Even Poettering called it "the software that currently breaks your audio" when it was first released. Still, no more OSS (the sound system, not open-source software, of course)!

Anyways, a year later, Poettering tries routing sound around his network, and discovers Apple's Bonjour. He's so impressed that he re-implements it as Avahi for Linux. The only thing impressive about it is the name, which backwards is "I-hav-a", advertising a service on a network, ha, ha.

Fast forward a few more years later, and Poettering is inspired by his previous successes to improve more parts of the Linux desktop. After struggling with init, he decides it's time for a rewrite, too! Traditional SysVinit had worked for decades, but after years of hacks to accommodate the ever-increasing complexity of modern hardware, it was becoming bloated. Yes, really. Enter systemd, another clever name, punning on ["System D"](https://en.wikipedia.org/wiki/System_D), the most hated piece of software ever, with the exception of Microsoft Windows.

Not all the information above is true, by the way. It's the themes and ideas that count, anyways.

What starts out as a simple init system baloons into 69 different services, taking over logging, hostname, date and time, locale, logins, container and virtual machine management, system accounts, networking, network time synchronization, DNS, and more. SysVinit may have been getting a little bit bloated, but it's nothing compared to the sheer fat of systemd. The solution? Stop thinking of systemd as an init. At this point, it's basically a whole OS minus the kernel. And systemd isn't even that bad at doing all of these things. Despite its obvious breadth, it actually manages to do a variety of these things, such as [containers](https://ta180m.github.io/blog/2021/01/03/worst-init-system-best-tool.html) quite well. The hate against systemd is psychological.

Lennart Poettering posted a [rebuttal against the systemd haters on his website](https://web.archive.org/web/20190310201738/http://0pointer.de/blog/projects/the-biggest-myths.html), but true haters are keen on pointing out holes in his arguments.

There's a running joke in Linux communities, that systemd has turned GNU/Linux into systemd/Linux. Of course, systemd is still much smaller than the entire GNU userland, but systemd has really been one of the main drivers of standardization in Linux over the past few years, along with the (evil?) Snap, Flatpak, and AppImage.

![Relevant xkcd](https://imgs.xkcd.com/comics/standards.png)

Aha! The other S word! Standardization: it's a love-hate relationship. On one hand, almost all Linux users would probably be in favor of fewer distros, more standardization in order to reduce the colossal fragmentation existing today. Fragmentation may give us choice, but with over 500 distros and increasing ever year, this is hardly an advantage. However, every standardization attempt meets the same fate: just look at [LSB](https://en.wikipedia.org/wiki/Linux_Standard_Base) or [freedesktop.org](https://en.wikipedia.org/wiki/Freedesktop.org) or systemd. It always starts out optimistic, but vocal critics start opposing standards for whatever reasons they can come up with, such as calling them a Red Hat conspiracy to take over the Linux desktop, and then it all falls apart.

Ironically, systemd has probably suffered the most criticism but also seen the most success, with basically all serious distros switching to it by 2016. Then again, there is still a active community of distros that pride themselves on avoiding systemd, so the war rages on, although one side is clearly the losing side.

The problem is that everyone wants *their* distro to succeed. Ask anyone to generate a list of distros they think should and should not exist, and you know which list their distro will be on. People want their distro's standards to win. At the end, it all becomes a struggle of egos. Even when we all recognize that we have way too many distros, there's no way to decrease this count without a lot of people getting angry. And even when distros voluntarily end, like BunsenLabs and Antegros, the community just ends up forking it 4 times over and we fragment more and more.

So what's the way out of this? One possible route is via big companies like Red Hat and Google. Look at how Red Hat pushed for systemd, and you'll get a slimmer of hope (fear?) that standardization is possible, if not extremely painful. Discontinuing distros doesn't work as we just saw, and mergers are disappointingly rare. Unfortunately, I don't see this improving any time soon.

