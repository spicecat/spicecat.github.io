---
title: "Switching to Linux"
date: 2020-08-11
description: "Thoughts of a lifelong Windows user switching to Linux (draft)"
type: "post"
---


*Originally posted as a [gist](https://gist.github.com/Ta180m/24cb12b80493fdf9f5c5b9b681cf6dfd)*


## Introduction

I've been using Windows for as long as I can remember, with some occasional macOS here and there. I first got my start with WSL (Windows Subsystem for Linux), which acts as sort of a compatibility layer for Linux executables, kind of like Wine in the other direction. I used it to get familiar with the Linux command line. A few months later, I installed the latest unstable Windows insider build to upgrade to WSL 2, which uses a complete Linux kernel instead and runs as a lightweight virtual machine. WSL 2 was a more compatible, so compatible in fact, that you can actually run a full desktop environment on it, although it isn't meant for graphical apps. My experiements with desktops in WSL 2 gradually convinced me that I also needed to try out the real deal — real desktop Linux. The final straw came when the latest Windows insider build wrecked my Windows install. After spending a day trying to fix it, I decided I needed a good backup in case Windows failed again. After cleaning up some free space, it's dual boot time!

So enter WubiUEFI. You were expecting Ubuntu, right? Well anyways, I started with WubiUEFI since it required no USB drives, no disk partioning, perfect for beginners. In case you haven't heard of it, WubiUEFI installs Ubuntu (or any Ubuntu-like distro) onto a virtual hard disk located right on your NTFS drive. It *just worked*. Amazing, right? Also my computer is a Thinkpad, which usually have good hardware compatibility with Linux, so I didn't have any device driver issues, excepting a device driver crash at the very end of the installation. So, I booted up Ubuntu and started to try it out.

A friend recommended KDE Plasma, so I installed it and gave it a try. It was truly *awesome*. I didn't want to completely abandon GNOME, so I used both of them for a while, but of course, I ended up going with Plasma. GNOME is kind of minimalistic to the point of stupidity, where trying to change a single setting might require hours of searching just to find out, you can't change it! On the other hand, Plasma's slogan says it all: "Simple by default, powerful when needed." I found Plasma to be especially suitable for me due to this and its extensive customizability. Overall, I felt that Linux just suited me better than Windows, and I decided I wasn't going back. I would still keep Windows for gaming, but I was going to switch to Ubuntu as my daily driver.

But WubiUEFI was only a temporary solution to a permanent problem. WubiUEFI had a number of disadvantages compared to a bare-metal install: it disabled hibernation which makes dual-booting really inconvenient, it had worse performance due to running a virtual ext4 drive on top of an NTFS drive, and as a result, it's also more vulnerable to filesystem corruption. So, I ended up digging up a USB drive after some extensive searching and I flashed an Ubuntu installation image to it. When I booted up, it warned me the drive had errors, but I recklessly went ahead, partioned my drive, and installed Ubuntu with it anyways, probably a bad idea, but that drive was \textit{very slow} because it was so old and it took forever to flash the image and boot from it. After all, I had gotten so far with it, I couldn't just restart from the beginning! Anyways, it worked just fine, and then I had to completely redo my Ubuntu setup again, which wasn't that bad considering that I only used WubiUEFI for a few days.

Well, now it's been a few more days, and here's a few thoughts about how my transition went.



## Overall


### Less RAM

Yes, yes! Windows was a RAM hog. Even when idle, it devoured over 4 gigabytes, more than half of my measly (by current standards) 7.5 gigabytes of RAM. Plasma uses around 1.2 gigabytes, more than a third less, and Xfce uses even less, although I only use Xfce for running extremely memory intensive apps such as virtual machines. (Xfce's main disadvantage for me is its lack of fractional scaling. It's either tiny windows or huge windows.) Now, my RAM usage rarely goes over 4 gigabytes, and I can use the rest as a cache.


### Learn to love the command line

Linux has come a long way, but in 2020, you still need to be able to copy and paste commands into a terminal. If you want to get the most out of Linux, you need to embrace the command line: it's your best friend and biggest ally, learn a few useful commands.


### Customize everything

This kind of ties in with the next section, but with Linux, you can customize *anything*. For example, if you don't like the look of GNU Grub, the bootloader, you can install a theme, or even better, make one yourself. I'm currently running a highly customized Plasma desktop which looks *nothing* like Ubuntu. If it weren't for the Focal Fossa wallpaper (the white one of course, the red wallpaper would look terrible) you probably wouldn't guess it was Ubuntu. And no, it's not Kubuntu: Kubuntu is the KDE Plasma desktop *plus* the entire KDE app suite. The GNOME system utilities work fine. Anyways, once you fall down the rabbit hole of customizing everything, you'll see Windows as rigid and inflexible.


### You have the power ...

Yes, you can do basically *anything*. The entire operating system is just waiting for you to mess with it.


### ... to break everything

And yes, you're just one `sudo rm -rf /*` away from completely destroying your machine. A few days ago I was messing with X servers and had to force a shutdown after my display froze. When I booted up again my Wi-Fi adapter was broken. What to do? So, I rebooted again and everything was perfectly normal as if that little scare had never happened.


### Smart web searching can fix about anything

One of the biggest reasons I picked Ubuntu was the abundance of onine support, whether it's https://askubuntu.com/ or https://help.ubuntu.com/community/.



## Plasma


### Virtual desktops

Plasma's virtual desktops put Windows's virtual desktop support to shame. It's much, much more powerful and useful. I tended to avoid using virtual desktops on Windows because they felt so awkward, but on Plasma they feel like second nature.


### Desktop effects

You might call them eye candy, but I love them. The desktop cube is a lovely visual mnemonic that gives me a spacial representation of my virtual desktops. And the window shattering effect? Well, it's fun to watch it every time.



## Apps


### Update (almost) all your apps with one command!

Yeah, this one's a huge improvement over Windows. Instead of hoping your app has an auto-updater or downloading a new installer and completely reinstalling the app, you can now just `sudo apt update && sudo apt upgrade`.  Great!


### And snaps, flatpaks, and appimages

Some applications require some more work than a `sudo apt install` to figure out if they are distributed as a snap, flatpak, or appimage, or simply not avaliable for Linux. Although snap auto-updates, which can be nice at times, if you could disable it when you needed, but nope, you can't disable snap auto-updates by design. Also snap apps tend to take longer to start as well, so I try to avoid in when I can. Except for the case of Chromium, which the workarounds include adding Debian repositories, using unstable dev versions which don't contain the Google API keys, or other crazier methods. So I'm unfortunately going to have to stick with a snap for Chromium.


### And you won't always be on the latest version

It al depends on how good your package manager's maintainers are at adding the latest versions of your apps. Flathub tends to be better than Ubuntu's own repositories at having the latest version.


### Some apps just aren't avaliable

Like Photoshop and Microsoft Office for example, and numerous other smaller programs, Linux still doesn't have the market share needed to build up a good 3rd-party app library yet. Although GIMP and LibreOffice are enough for me.


### Apps are smaller?

From what I've noticed, apps seem to smaller on Linux, sometimes by more than 80%. For example, GIMP on Windows clocks in at over a gigabyte, but the corresponding `apt` package installs to less than 200 megabytes. Similarly, QEMU on Windows will set you back by about a gigabyte as well, but the `apt` package installs to only around 100 megabytes. Maybe has to do with shared libraries or something like that.



## Miscellaneous


### Screenshots

Yes, this one took me quite a while to figure out. PrtScn simply did nothing. Turns out I just installed the `kde-plasma-desktop` package which doesn't come with the entire KDE app suite. So, I manually installed Spectacle, the KDE screenshot utility, and everything worked. Great!


### Hibernation

This one is actually quite tricky to set up. First, you need to make a swap file that's as big as your RAM. Then, you can add some text to a specific file which will tell Plasma to show a hibernation option in the menu. The last piece of the puzzle for me was to disable secure boot. Secure boot is kind of useless for me anyways, because it's mainly supposed to protect against evil maid attacks, but seriously though, who's going to try to rig my computer?


### More bugs?

After installing KDE Plasma, whenever I run GNOME, I always get a load of notifications telling me K-something just crashed. Even Plasma has a few apps crash here and there, but nothing serious. For example, the file indexer was crashing at every login, so I ended up reinstalling it and recreating its index, which fixed it.


### Graphics drivers

I'm sticking with Nouveau for now. The official (proprietary) Nvidia drivers induce too many graphic bugs and break hibernation. Specifically, I can't resume from hibernation. However, Nouveau is also slower, but all my gaming is on Windows anyways.


### Mouse speed

After an hour of searching, I had an answer to my question, can I increase the mouse speed beyond the maximum in the settings menu? And the surprising answer to this was no. (well, not without breaking other stuff) So disappointing! So I guess you can't do *everything*.


### Function keys

I hate my keyboard now. The function keys are so high! How big do they expect my hands to be? In Windows I only ever used F5 to reload and F11 to go fullscreen. But now so many keyboard shortcuts, such as switching virtual desktops, require function keys.


### Inconsistent copy and paste

Is it Ctrl-V or is it Ctrl-Shift-V or is it Shift-Ins or middle click? It all depends on the application.


### The touchpad still sucks

I have yet to come across a computer that's not a Mac with a good touchpad. Maybe it's just the hardware, but my computer's touchpad is janky with Linux and janky with Windows.


### Tablet computers aren't supported very well

My two-in-one computer's touchscreen worked fine. What didn't work fine were apps: many of them simply just treated the touch input like mouse clicks and gestures such as two-finger scrolling didn't work. Also, my computer didn't recognize that it was in tablet mode and I needed to manually pull up a touch keyboard every time I wanted to type something.



## Further Reading

- https://medium.com/hackernoon/24-things-learned-as-software-developer-on-ubuntu-for-a-weekish-5b7b0da5d4b5
