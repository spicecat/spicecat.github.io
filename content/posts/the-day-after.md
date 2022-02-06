---
title: "The Day After"
date: 2022-02-01T12:16:38-06:00
draft: true
description: "Things I learned from installing every Arch package"
type: "post"
tags: ["linux", "web", "self-hosting"]
---


*Disclaimer: This post is boring. You should read [Installing Every Arch Package](/posts/installing-every-arch-package) instead.*

So, about that other post... it kind of blew up on [multiple](https://www.reddit.com/r/archlinux/comments/shj0qe/installing_every_arch_package/) [subreddits](https://www.reddit.com/r/linux/comments/shxq12/installing_every_arch_package/), [Hacker News](https://news.ycombinator.com/item?id=30160191), [Lobsters](https://lobste.rs/s/yjwniu/installing_every_arch_package), [Tildes](https://tildes.net/~comp/109h), and more. People have already made YouTube videos of it. I even received spam emails about it. During those 8 hours, my website received more traffic than everything before that combined.

Meanwhile, I was busy sleeping. Seriously. I didn't expect *at all* that this would happen. My website has (or more accurately, had) about five, plus or minus 10, regular readers, and I was entirely unprepared for the chaos...


## Remember to optimize my images!

🤦 🤦 🤦

I want to facepalm a million times for this.

When your blog has no readers, no one ever complains about the images not being optimized.

Anyways, thanks to [conaclos on Hacker News](https://news.ycombinator.com/item?id=30162049) for pointing this out!

> Please, stop using heavy images: bloated-kde.png is 3.2Mb... The image is still loading in the moment of writing... Same note for the website logo: render-small.gif is 4Mb. Still loading... 

It's always been bugging me that the dodecahedron logo is so big (it's actually the "small" version, since the original render is 32 MB), but I keep on forgetting to optimize it. I almost never think about the load times since the server is on my LAN and the images are always cached for me.

Anyways, I'm in the process of converting all the images on this website to [WebP](https://en.wikipedia.org/wiki/WebP), so this should be fixed soon.


## Get better internet

Yeah, my website was [hugged to death](https://en.wikipedia.org/wiki/Slashdot_effect). This was due to a combination of several reasons:

- I migrated my personal repositories and websites from GitHub to exogit, so I was hosting the website myself on a homelab server.

- My images weren't optimized as discussed above, so each reader had to download about 12 MB of content.

- My home internet is... underwhelming. I can usually get only 10 mbps upload speed, but during the peak of the "attack", my server was handling about 20 mbps of traffic.

I was outside my house (and thus outside the comfort of my LAN) when I discovered my internet bandwidth was getting absolutely crushed by the huge influx of vistors, so I was barely able to start a very slow SSH session into the exozyme server to optimize the images. Fortunately, after optimizing the largest few images, things went cleared up a bit.


## My CI broke

I use [Woodpecker CI](https://woodpecker-ci.org/) for deploying this website, and when I tried pushing some image optimizations, the CI wasn't rebuilding and deploying the website! 

So there was a [Woodpecker AUR](https://aur.archlinux.org/packages/woodpecker/) update the day before, but for exozyme specifically, I additionally apply [some patches](https://github.com/Ta180m/woodpecker). I had used `makepkg -e` to build the package, which was the big mistake. This doesn't run the PKGBUILD's `prepare()` function, which is necessary in this case to compile everything with dynamic linking instead of static linking. Next time, I need to remember to do the patching in the PKGBUILD instead of manually.


## My website's IPv6 is broken

Stupid router... the Netgear RAX45 is utter garbage and doesn't have any option in its GUI to allow ports through its IPv6 firewall. Now, older Netgear routers have a way to enable Telnet and log into a command line via that, but not this one! Custom firmware time? Oops, this router has a crummy Broadcomm chipset, and who knows when OpenWrt and DD-WRT will support it. Probably never.

For now, I simply removed the AAAA entry from this website's DNS, but it's just frustrating that *everything*, including my ISP, are entirely capable of IPv6, with the sole exception of this router.


## Various Arch Linux packaging bugs

This is also mentioned at the end of the last blog post, so I won't say anything more about it here.


## Things I did right: Get feedback before publishing the post

This helped catch a few typos before the Reddit and Hacker News mobs descended on the post, so I'll definitely get some feedback on this post too before publishing it!
