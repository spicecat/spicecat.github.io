---
title: "Fun with QEMU/KVM! - The Sequel"
date: 2021-01-07
draft: true
type: "post"
tags: ["Linux", "Virtualization"]
---


*Originally posted on my [old blog](https://git.exozy.me/Ta180m/blog/src/branch/main/_posts/2021-01-07-fun-with-qemu-kvm-2.md)*


![Linux Mint with 255 cores](/blog/assets/mint-255-cores.png)

As far as I know, there aren't any 255 core processors on the market. Yet. But that doesn't stop us from making a virtual machine using [QEMU/KVM](/blog/2020/11/18/fun-with-qemu-kvm.html) and [SMP](https://en.wikipedia.org/wiki/Symmetric_multiprocessing) with an absurd number of processors, as shown above.

Why 255? Well, that's the limit apparently. Yeah, it sucks. I wish it was higher too. But if you're running more cores than the number of physical cores available on your computer, there's no benefit and you'll probably see worse performance. No one even has that many physical cores to begin with, so there's no incentive for QEMU/KVM to support even more cores. I'm pretty sure that only the first 64 cores are KVM acclerated, which adds another reason why you shouldn't do this. (virt-manager also warns you from against a VM more cores than you actually have. It's a bad idea.)

And why [Linux Mint 20.1](https://www.linuxmint.com/rel_ulyssa_cinnamon.php) MATE? Well, it happened to have been released lately, and I haven't had much exposure with MATE, so I thought it would be the perfect opportunity to download an ISO and take it for a spin with 255 cores.

One final note to application developers: make sure your software can handle extreme, absurd cases. Corner cases will screw you over if you don't prepare for them in advance! MATE System Monitor seems to be handling the overabundance of cores quite well, but the window automatically resizes based on the number of cores, and I can't scroll down. Still, the system seems to be handling it, and of course, there isn't any general reason why you would want to use so many cores, unless you were trying to impress your friends. Maybe 255 (most likely 256) cores will become the norm someday since frequency scaling is long dead by now. And then all the apps and tools that print out the status of every core will really be screwed.

