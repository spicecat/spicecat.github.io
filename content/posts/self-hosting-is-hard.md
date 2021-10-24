---
layout: post
title:  "Self-hosting is Hard!"
author: Ta180m
tags: ["Linux"]
---


It's been over a week since I've completed my build and switched over many things to self-hosting. Here's how it went:


## It works!

### Remote desktop

![VNC](/blog/assets/vnc.png)

VNC works perfectly. OK, fine, I haven't figured out clipboad sharing yet, but other than that, it's perfect. I also tried Xrdp but didn't have much luck. There's also X2Go which bundles some extra perks like sound and clipboard sharing, but the image quality is blurry at times. Oh well, VNC is better anyways! 

### Nextcloud

![Nextcloud](/blog/assets/nextcloud.png)

Nextcloud is basically a huge hammer that tries to attack every nail. For most cases, a more specialized tool would be better, but Nextcloud can still give you a surprisingly functional solution to... file sharing, real-time collaborative document editing, photo management, chat, email client, contacts, calendar, music streaming, notes, tasks, forms, maps, Matrix client, and RSS client. So yeah, Nextcloud knocks down quite a few bowling pins with one gigantically overpowered bowling, or perhaps more accurately, wrecking ball.

I anticipated a painful setup process for such a large monolith, but it went surprisingly smoothly. Perfect!

### Gitea

![Gitea](/blog/assets/gitea.png)

Gitea is one of the most boring things I've ever self-hosted. It just simply works! All my problem solving skills are simply going to waste... And I still don't know how to pronounce that name...

On a more serious note, I'm currently using it to mirror all my GitHub repositories, since like it or not, GitHub is where it's at. So my "hybrid hosting" seems to be the best compromise.

### QEMU/KVM

![Virtual Machine Manager connected to my home server](/blog/assets/vmm.png)

Awww yeah, my favorite long acronym! QEMU/KVM is awesome, but I didn't know it was *this awesome*! Now I can run all my virtual machines on my laptop, but actually on my home server, without my laptop's fans spinning up loudly!

### Jupyter notebooks

Another thing that boringly just works. It's great to be able to run computationally intense things without my laptops fans screaming.


## Kinda works

### Matrix

Maybe it's just Synapse's fault, but my Matrix homeserver devours RAM like a starving lion. Why does it need 1.5 GB? Sure, I have 16 GB, plus another 16 GB of swap (for hibernation), but Synapse simply shouldn't need that much RAM.

And don't get me started on `mx-puppet-discord`. It may have seemed like just a small thing to self-host, but it was by far the hardest to set up. *And* it even uses a noticable bit of CPU in the background as an added bonus.

### DIY cloud gaming

![SuperTuxKart, streamed from the "cloud"](/blog/assets/stk.png)

As crazy as it sounds, this is actually nearly usable! The only thing preventing this from working perfectly are my [terrible GPU](/blog/2021/03/25/worst-first-build-part-4.html) and the limitations of VNC, since proprietary cloud gaming services use their own protocols optimized for low latency. I can get sound using X2Go, but it doesn't always work well. Plus X2Go's image quality is not the best. Still, we'll see how this goes, since it's pretty promising!


## Nope

### Pi-hole

Pi-hole is great! I actually really like it. But *why* does it need to use its own version of `dnsmasq`? It just wants to break my virtual networks, doesn't it? Now my VMs don't have internet! Maybe I won't have this problem if I run it in Docker. But Docker is a completely different beast I kind of want to avoid for now if I can. More maintainence costs, anyways.


So there you have it. If you want to self-host, there's something crucial that you need: time, lots of it. With enough time, anything is possible. Even getting `mx-puppet-discord` to work.

