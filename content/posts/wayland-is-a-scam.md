---
title: "Wayland is a Scam"
date: 2020-04-21
draft: true
type: "post"
tags: ["Linux", "Rant"]
---


*Originally posted on my [old blog](https://git.exozy.me/Ta180m/blog/src/branch/main/_posts/2021-04-21-wayland-is-a-scam.md)*


With every new release of GNOME, Plasma, Ubuntu, and Fedora, there's always something about Wayland being hyped. Wayland support only keeps on getting better and better with each and every new release. There's only one problem: Wayland is almost 13 years old and still hasn't made much of a dent in X11's dominance. We've been promised for years and years that Wayland is the future, but a decade later, it still hasn't delivered. This, to put it simply, is a scam.

It's a common excuse that [Nvidia](https://www.youtube.com/watch?v=iYWzMvlj2RQ) has been restraining Wayland's progress, but that's hiding the truth. But look at what happened with systemd, which started at around the same time. By 2016, *all* major distros had completely finished the transition, and systemd was ubiqutious. (Much to the chagrin of its critics) Anyways, how did it happen, and how did it happen so quickly? Well, the answer lies in its excellent legacy support.

People have updated old Arch systems dating prior to the big transition without any problems. systemd can truly do anything its predecessors could do (and a lot more, leading to the common perception that it's extremely bloated), and transitioning was as simple as drop and replace. Can Wayland do that? No way! There's Xwayland, and Nvidia issues aside, it's half-baked an missing important functionality. Something as simple as scaling an Xwayland window leads to disgusting blurriness and artifacts. It's been like this for years, and may never be fixed. And to make matters worse, some apps are simply never going to be ported to Wayland, so we're going to be stuck with Xwayland for a long time.

What about Wayland itself? Unfortunately, it's not even close in terms of feature parity to X11 either! Basic things like color management are simply lacking, compared to X11. You can't just parade an incomplete project and call it the future of Linux graphics, when it still lags behind X11 in many areas.

There's a [great article by Dedoimedo](https://www.dedoimedo.com/computers/wayland-2021.html) about this topic, where he takes the conservative position that Wayland isn't even needed at all. That's another common criticism of Wayland, but any of these critics haven't seen the gory mess that is modern X11. The X protocol was invented more than a decade before GPUs started becoming commonplace, so you can imagine how backwards it is. And over the years, it's been augmented in countless ways, hacking in support for touchscreens, high DPI, you name it. It's somehow chugged along, becoming increasingly bloated and hard to maintain, so Wayland wasn't created just so Red Hat could rake in profit. (Neither was systemd, despite its fiercest critics's claims otherwise) But compare the transition with systemd, and it's blatantly obvious that something seriously wrong has been going on in the past 12 years. With Nvidia's recent announcement to invest more in supporting Wayland, there's hope that this mess could start cleaning itself up. I'm not optimistic.

