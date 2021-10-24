---
title: "The Worst Init System's Best Tool"
date: 2021-01-03
type: "post"
tags: ["Linux"]
---


*Originally posted on my [old blog](https://github.com/Ta180m/blog/blob/main/_posts/2021-01-03-worst-init-system-best-tool.md)*


True story: a few weeks ago, I wanted to test out SuperTuxKart but I didn't want to install it on my computer. I had a few options: use a virtual machine and suffer terrible graphics performance, use Docker and suffer the pain of trying to set up graphical acceleration; or use LXC/LXD and suffer the (massive) pain of trying to set up basically anything. I ended up just installing SuperTuxKart to get out of the triple-sided dilemma.

I didn't know it at the time, but I had the right tool for the job already installed. In fact, the vast majority of Linux systems actually have this tool installed as well. It's called `systemd-nspawn` and it's surprisingly easy to use.

Let's get started. I'm using an Arch host and Arch container. Other setups should work as well, but using the same OS for the host and container should give you the best compatibility.

```sh
sudo -s # get a root shell
cd /var/lib/machines # default directory for nspawn containers

# create a container
mkdir archlinux
pacstrap -c archlinux base nano fish sudo neofetch # add more packages here
exit # exit the root shell

# now "chroot" into it
sudo systemd-nspawn -D /var/lib/machines/archlinux
passwd # set a root password
rm /etc/securetty /usr/share/factory/etc/securetty # remove some problematic directories, optionally add them to NoExtract in /etc/pacman.conf
useradd -m -s /bin/fish -G wheel ta180m # add a user
passwd ta180m # set password
exit # exit the "chroot"

# now the magic happens
sudo systemd-nspawn -b -D /var/lib/machines/archlinux
# log in with the user account
```

To understand what `systemd-nspawn` does, think of `chroot` but "on steroids". The underlying simplicity of this virtualization method makes it easy to run GUI apps, for example.

```sh
xhost +local: # allow local connections to X server
# share pacman cache and graphics cards
# may need to bind more directories for Nvidia cards
# you must have the exact same drivers on the host and container for this to work!
sudo systemd-nspawn -b -D /var/lib/machines/archlinux --bind=/var/cache/pacman/pkg/ --bind-ro=/tmp/.X11-unix --bind=/dev/dri --bind=/dev/shm
export DISPLAY=:0 # set the display
# now you can run GUI apps!
```

Here's SuperTuxKart in all its glory running in a container with full graphical acceleration!

![SuperTuxKart in a container](/images/nspawn-supertuxkart.png)

And that's it! Now you have a fast, simple way to test GUI graphically accelerated apps without messing with your host OS. (I still haven't gotten sound to work yet, but it shouldn't be *that* hard...)

Part of the simplicity of `systemd-nspawn` is that it is more of an extension of the age-old `chroot` instead of trying to virtualize too much like Docker. There's no need to worry about virtual network devices, virtual disks, volumes, or any of that stuff. Sure, that limits it in many ways, but it is still a very powerful OS virtualization method when the host and container are running the same OS. Previously, I had also experimented with QEMU/KVM for this, but it seems overkill since the host and guest can share much the OS such as the kernel. Of course, full-blown virtual machines have their own horde of problems, such as terrible graphical acceleration unacceptable for testing SuperTuxKart.

Here are a few possible use cases:

 - Installing 32-bit libraries in a container to avoid polluting the host OS

 - Using proprietary NVIDIA drivers in the container and rendering the host's desktop with free drivers

 - One-time testing of apps to avoid installing them on the host

 - Using a different version of a library than the one of the host and avoid [dependency hell](https://en.wikipedia.org/wiki/Dependency_hell)

 - Having another copy of the OS that you can mess with

And the list goes on and on.

There's one final thing I need to clarify, and that's the title. By worst init system, you probably know which one I'm talking about: systemd. I'm not saying that systemd is buggy and doesn't work well (like btrfs for instance), since it works fine and I've never had any problems with it. The issue with systemd is that it tries to do too much. According to the all-knowing [ArchWiki](https://wiki.archlinux.org/index.php/Systemd):

> *[systemd] provides a system and service manager that runs as PID 1 and starts the rest of the system. systemd provides aggressive parallelization capabilities, uses socket and D-Bus activation for starting services, offers on-demand starting of daemons, keeps track of processes using Linux control groups, maintains mount and automount points, and implements an elaborate transactional dependency-based service control logic. systemd supports SysV and LSB init scripts and works as a replacement for sysvinit. Other parts include a logging daemon, utilities to control basic system configuration like the hostname, date, locale, maintain a list of logged-in users and running containers and virtual machines, system accounts, runtime directories and settings, and daemons to manage simple network configuration, network time synchronization, log forwarding, and name resolution.*

Whoa! That's a lot!

Much of the hate that systemd receives stems from these blatant violations of the [Unix philosophy](https://en.wikipedia.org/wiki/Unix_philosophy). systemd does not do one thing and do it well, unlike its predecessors. It does dozens of things, and arguably, it doesn't do them badly, but thought of systemd slowing expanding its grasp on your entire OS is unacceptable to some people. But of course, this begs the question of whether it is really necessary to adhere so strictly to the Unix philosophy, since most big, standalone apps like GIMP and [LibreOffice](/posts/linux-office) obviously violate it.

Still, systemd is everywhere these days, so it might be better to get used to it. Many of its tools are quite good, and `systemd-nspawn` in particular is exceptional. After watching the proliferation of systemd in the past few years, it's undeniable that it's here to stay.


## Further Reading
 
 - [An introductory tutorial](https://patrickskiba.com/sysytemd-nspawn/2019/02/08/introduction-to-systemd-nspawn.html)
 
 - [Tutorial for GUI apps](https://patrickskiba.com/sysytemd-nspawn/2019/03/21/graphical-applications-in-systemd-nspawn.html)
 
 - [Another tutorial for GUI apps](https://liolok.github.io/Run-Desktop-Apps-with-systemd-nspawn-Container/)
 
 - [From the ArchWiki](https://wiki.archlinux.org/index.php/Systemd-nspawn)
 
