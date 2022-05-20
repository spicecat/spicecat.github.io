---
title: "The End of the OS Wars"
date: 2021-06-22
draft: true
type: "post"
tags: ["Windows", "Linux"]
---


*Originally posted on my [old blog](https://git.exozy.me/Ta180m/blog/src/branch/main/_posts/2021-02-15-end-of-os-wars.md)*


**Warning**: Really long and disorganized post ahead. Half of it was written in October 2020 and the other half in February 2021, so that should give you an idea about how bad this post is. You should probably skip this one.


According to open-source advocate Eric S. Raymond, the end of Windows may be in sight. A few days ago, on his blog, he posted a [very thought-provoking article](http://esr.ibiblio.org/?p=8764) about the future of Windows and Linux. So that got me thinking: what does the future look like?


There are basically three possibilities for the future:

1. Linux overtakes and dominates Windows in market share, perhaps from Microsoft adopting the Linux kernel as what Raymond suggested.

2. Linux stays at around its current market share forever. It seems to me that the current situation isn't exactly a very stable equilibrium, but hey, Linux has been roughly in the same zone for at least 15 years, so maybe this could continue indefinitely.

3. Linux market share on the desktop asymptotically approaches zero and becomes a hobbyist OS (again). Unlikely, since there seems to be a pretty healthy community of people supporting it right now. MacOS has always been taking away a chunk of would-be Linux users, and since it's gaining market share, that could be a bad thing for Linux.


## Case 2

We're going to start with possibility 2, since it mirrors the present the closest. What's preventing Linux market share from increasing beyond the already-impressive 2-3%? Two things: preinstalled hardware and apps.

Manufacturers are definitely pumping out more Linux computers these days, with the big brands like Dell and Lenovo in the game now. Linux market share has also been slightly increasing, and this may be a possible contributor. Preinstalled hardware provides much more benefits than just the obvious now laypeople don't need to bother to do the installation themselves. But also, manufacturers are not going to sell you broken hardware that doesn't work with Linux; they're going to at least but the bare minimum effort the make sure it works decently. Maybe it won't be Windows-level (which is a pretty low bar to pass, since many OEM drivers are horrendous), but it'll be better than now, where hardware incompatibilities and issues still plague the Linux world. I have a friend who tried out Kubuntu, but guess what? His laptop and Kubuntu didn't really get along well, so, back to Windows 10!

What about apps? The state of Linux apps has come a long way in the past few years, with the rise of distro-agnostic packages like Snap (the chaotic one), Flatpak (the lawful one), and AppImage (the neutral one), the ([evil](https://medium.com/@boundarybreaker/electron-is-a-hulking-monstrosity-of-a-wora-framework-and-it-needs-to-be-replaced-25e9d849b0e)) Electron framework, improvements in [Wine](https://www.winehq.org/announce/6.0) and [virtualization](https://github.com/Fmstrat/winapps), and other stuff that I'm too lazy to list. But there's still some noticeable gaps: Microsoft Office (there's a [quite bad (what type of bracket to use for triply nested parentheses?)] web version), Adobe stuff, and pro audio and video production apps. Yes, there's LibreOffice and GIMP, but repeat after me: LibreOffice is not Office and GIMP is not Photoshop. And don't get me started on the absolutely disgusting fragmentation of the wild west of Linux distros. It's downright terrible. Terrifying. That's why Snap and friends are a thing, and address this problem to varying degrees of success. But having a package manager is a pretty nice tradeoff!

So can these things stay in this quasi-stable equilibrium? Maybe. It's been over 15 years like this, and it's not hard to extrapolate this into the future. OEM Linux computers might stay a dev thing indefinitely. Adobe Photoshop could never get ported. But what about the other cases?

## Case 3

Oh, the terror, shriek the Linux fans! Some have predicted the [downfall of Linux](https://www.dedoimedo.com/computers/linux-beginning-of-the-end.html), and it's not too fun to imagine. If there's one threat to Linux market share right now, it's probably macOS. There are 100 kinds of people out there: those who could use Linux and do, those who could use Linux but don't, those who can't use Linux in its current state or would otherwise have a hard time, and those who don't know binary. Anyways, we aren't going to touch on the first case for obvious reasons. The second one is much more interesting: there are a lot of developers out there who actually prefer macOS or even Windows. (How could they, shriek the Linux fans! I know, it's awful.) And devs are the perfect people to try to convince to switch to Linux, since they usually having the technical aptitude and attitude to learn and use Linux. (Basically, if you have the aptitude to use `aptitude` [the package manager frontend], I'm throwing you into the category of people who could use Linux) And macOS market share is, *shudder*, rising. Pretty fast, actually. And macOS has all sorts of real advantages over Linux, such as hardware that's guaranteed to work and decent app support due to its fragmentation of exactly one "distro". Of course it comes with its own hulking share of issues as well, but a lot of people either don't know or don't care about these things, whether it's [telemetry](https://www.dedoimedo.com/computers/telemetry-should-you-allow.html) or [vendor lock-in](https://en.wikipedia.org/wiki/Vendor_lock-in). So yeah, if you want to use macOS, do it in a [VM](https://github.com/kholia/OSX-KVM). I personally find this case pretty unlikely, given the sheer volume of existing Linux users, as well as the fact that Linux is always at the forefront of innovation on the desktop, whether it's virtual desktops or app stores. Microsoft and Apple are basically monopolies and they don't need innovation when they can mine your data for immense profits.


## Case 1

And the dream case: Linux for the win! Eric Raymond's argument is definitely the most bizarre and interesting endgame I've heard of resulting in this case, and it seems... un-Microsofty in my opinion. Even if it were to happen, it would definitely be at least five years away. It just doesn't really make sense for Microsoft to completely nuke their NT kernel, especially with Windows 10X right around the corner. Maybe this could happen 10 years from now though, but I still think it's kind of unlikely. But really, is the current situation *sustainable* in the long run? Linux has taken over the server market and a huge chunk of the mobile market, why not the desktop market next? If preinstalled hardware really becomes a thing, a big thing, and app support gets ironed out as more people switch, it could become a positive feedback loop!

Let's think in terms of a small disturbance, like in calculus. What if Linux market share, by complete chance, were to take a step in the upward direction, say, tick up from 3% to 3.01%? Assuming there are one billion PCs out there, that's an increase by 100 thousand! That's 100 thousand more potential consumers for your Linux app or hardware. And this could have an impact, a small impact, but one nonetheless, on the amount of effort that hardware companies spend on Linux compatibility, or developers making a few more ports to Linux, or just having a [larger community](/blog/2021/02/14/i-btw-use-arch.html) of people to interact with. It could make people less likely to choose macOS over Linux. So those are all positive feedback things.

What about negative feedback? Well, there are quite a lot of problems with Linux right now, such as lack of apps in important areas, and the general need to be more technically capable. If this was a post about messaging apps, I would also bring up [network effects](https://en.wikipedia.org/wiki/Network_effect), which arguably applies here as well. There's quite a lot of negative feedback going on here, so it's hard to say whether we are in a stable or unstable equilibrium.


## A final thought

Does market share even matter? Linux market share has been pretty much stagnating since 2015, with a small peak in June 2020. To end things here, I'll just say that existing methods of estimating market share are not exactly known for being precise, and it's near impossible to estimate exactly how many people use Linux, so I wouldn't say it's a number we should intently focus on.

Thanks for reading these disorganized ramblings. Now what's the proper way to end a video call...


References:
 - http://esr.ibiblio.org/?p=8764
 - https://www.computerworld.com/article/3438856/call-me-crazy-but-windows-11-could-run-on-linux.html
 - https://hothardware.com/news/microsoft-and-linux-sitting-in-a-tree
 - https://www.neowin.net/news/eric-raymond-thinks-microsoft-is-ready-to-swap-out-the-windows-kernel-for-linux

