---
title: "Weirder Linux Tricks"
date: 2021-02-21
draft: true
type: "post"
tags: ["Random", "Linux"]
---


*Originally posted on my [old blog](https://git.exozy.me/Ta180m/blog/src/branch/main/_posts/2021-02-21-weirder-linux-tricks.md)*


Here's some more weirder Linux tricks, if the [first post](/blog/2020/12/23/weird-linux-tricks.html) wasn't enough.


## Faster than host guest

What? How can the VM be faster than the host? It's possible if the host is a [`systemd-nspawn`](/blog/2021/01/03/worst-init-system-best-tool.html) container. Just pass through KVM acceleration with `--bind=/dev/kvm`, and you'll be shocked at how much faster the VM is compared to the `systemd-nspawn` container. Yes, for raw CPU virtualization, KVM really is that fast.


## Arch all the way down

[Meta](https://github.com/Ta180m/Arch-All-the-Way-Down)!


## Make Linux fast again

Pass the `mitigations=off` kernel parameter in your bootloader to disable all CPU exploit mitigations that protect you from the nasty [Spectre](https://en.wikipedia.org/wiki/Spectre_(security_vulnerability)) and [Meltdown](https://en.wikipedia.org/wiki/Meltdown_(security_vulnerability)) vulnerabilities. This is pretty much the pretty much the computing equivalent of anti-vaxxing, since widespread patching against these vulnerabilities have prevented them from showing up in attacks in the wild. However, the performance gains are really not worth the risk, so use this very wisely!


## DoS yourself!

Don't run `:(){:|:&};:`. Don't do it. If you want to take the risk, first limit the number of processes you can run with `ulimit`. You've been warned.


## `sudo rm -rf /dev/cpu/0/`

OK, not really, but you can do `echo 0 | sudo tee /sys/devices/system/cpu/cpu0/online` to disable CPU 0. Just don't try to take down all your processors at the same time.

