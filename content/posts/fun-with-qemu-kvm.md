---
title: "Fun with QEMU/KVM!"
date: 2020-11-18
type: "post"
tags: ["Linux", "macOS", "Virtualization"]
---


*Originally posted on my [old blog](https://git.exozy.me/Ta180m/blog/src/branch/main/_posts/2020-11-18-fun-with-qemu-kvm.md)*


For many people, "virtual machine" is effectively synonymous with VirtualBox or VMWare or perhaps Hyper-V. But for us Linux users, there is actually another alternative. You may have heard of QEMU before, but it's an emulator and therefore much slower than hypervisors like VirtualBox. However, by using the Linux kernel's built-in kernel virtualization module (KVM) combined with QEMU, we can achieve impossible near-native speeds. So let's see what we can do with QEMU/KVM...


Let's try Debian first:

![Debian](/img/debian.png)

Not bad! It seems much faster than VirtualBox or VMWare, or maybe that's just because of i3... The CPU is definitely running at almost-native speeds, the disk speed -- not so much, as expected. It's also detecting a paravirtualized graphics card, so the graphics aren't too bad, but there's no OpenGL unfortunately. Anyways, QEMU/KVM is going pretty strong so far.


Let's give Android-x86 a try:

![Android-x86](/img/android-x86.png)

Pretty good! I don't think Android is detecting the paravirtualized graphics card, so that might explain the sluggish graphics performance. I can even connect to it using KDE Connect! It's using a lot of RAM, but my computer's fans aren't spinning like crazy like when I run a VM using VirtualBox.


Now time for some [OSX-KVM](https://github.com/kholia/OSX-KVM):

![Big Sur](/img/big-sur.png)

Surprisingly, even Big Sur runs fantastically. OK, maybe not fantastically, since there's no graphics card, so the graphics are very sluggish this time, but other than that, it's much better than something I could hack together with VMWare or VirtualBox. QEMU might even become the optimal way for Hackintoshes, since Apple Silicon has spelled the end of running macOS on other processors. Big Sur also uses quite a lot of RAM, but I think using i3 on my host laptop helps. And it just happens to be the same resolution as my laptop screen, so when I go fullscreen... complete immersion! Just like a real Mac with a nonexistent graphics card, I guess?


Overall, QEMU/KVM combines the flexibility of QEMU, a general-purpose emulator, with the speed of KVM, a built-in hypervisor module in the Linux kernel, to deliver an unbeatable virtualization solution for desktop users. The biggest drawback is that it is Linux-exclusive, obviously, although it apparently can run on WSL 2 with nested virtualization enabled with much worse performance. Virtual machines are no longer slow and resource-hogging, not if you use QEMU/KVM!

