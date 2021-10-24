---
layout: post
title:  "How to Break a Rolling Release"
author: Ta180m
tags: ["Linux", "KDE"]
---

It's the day! Plasma 5.21 is out!

First, let me flex my `neofetch` to answer all your burning questions about my OS:

![neofetch](/blog/assets/neofetch.png)

Now, time for the update. The big one. The closest thing to a point update in a rolling release. And...

![yay](/blog/assets/yay.png)

Lots of updates, but Plasma 5.21 is not one of them.

Digging a bit deeper, it looks like it's still in [testing](https://wiki.archlinux.org/index.php/Official_repositories#Testing_repositories). Looks like we need to enable it first. Hopefully my computer doesn't explode or something when I do this...

![yay with testing](/blog/assets/yay-testing.png)

There we go! Looks like Linux 5.11 is part of this sweet deal too! Let's break our rolling release! I mean, what could go possibly wrong? It's *only* 1263.42 MiB of packages. And I don't have a backup ready. Great!

A few minutes and a reboot later...

OK, the boot looks good, no black screens or anything. Plasma (looks like the X11 session got renamed from Plasma to Plasma X11) on X started up extra fast... and we're in!

![Plasma 5.21](/blog/assets/plasma-5.21.png)

Some first impressions: The new Breeze Twilight theme looks awesome! I love hybrid light-dark themes! The application launcher is also organized a lot better now.

![The new system monitor](/blog/assets/system-monitor.png)

The system monitor app looks pretty good too and seems infinitely customizable, although wasn't the old Ksysguard working just fine? Whatever.

![The firewall configuration settings](/blog/assets/firewall.png)

Now for the new firewall configuration settings... looks like I need to install a firewall first! A few minutes later... what a nice place to insert a giant picture of Konqi! Moving on.

The settings app has generally been cleaned up some more. There's a few other new settings, such as software updates, where I can now enable automatic updates to break my rolling release! How nice!

![New Application Launcher](/blog/assets/plasma-5.21-app-launcher.png)

The biggest disappointment is the new Application Launcher. While I think it is a bit better organized, it's also less keyboard-friendly. Previously, after doing a search, you could press the down key once to select the second option shown. Now, you need to press the down key *twice*, injecting extra keystrokes in an area where keystroke efficiency is key (no pun intended).

Now for some Wayland...

![Plasma 5.21 Wayland](/blog/assets/plasma-5.21-wayland.png)

Of course. The screen scaling is all wacko when I try to scale apps up 1.5x. Native Wayland apps look perfectly fine, but everything else, including much of Plasma, still looks pretty bad. Apparently it's a result of [this bug](https://bugs.kde.org/show_bug.cgi?id=389191) and it looks like two years later, it still hasn't been resolved yet.

![Plasma crash](/blog/assets/plasma-crash.png)

And finally, we got a crash! Hooray! Just like last time I tried Wayland. Looks like the next update will be the one where Wayland is finally usable?

The only disappointment that I have about Plasma 5.21 and this latest update is that nothing broke! Well, Wayland had some crashes, but it's always been kind of broken, so I'm stuck on X11 for now. There were 1263.42 MiB of packages that could have broken in this update, *and* I enabled the testing repository, but they didn't! How could they? How dare they actually respect my time so I don't have to waste an hour fixing my rolling release! So tragic.

