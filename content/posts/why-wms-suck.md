---
title: "Why WMs Suck"
date: 2020-12-26
type: "post"
tags: ["Linux", "Rant"]
---


*Originally posted on my [old blog](https://github.com/Ta180m/blog/blob/main/_posts/2020-12-26-why-wms-suck.md)*


WM fans, don't kill me for saying this, but window managers suck. To see why, let's examine the process of installing and configuring a WM.


## Installing a WM

OK, I'll admit that this step is much faster. Most WMs are only a few megabytes and take a few seconds to install, even with slow package managers like `urpmi`. Try installing something like KDE Plasma on Mageia or even Arch. It's going to take a while. (Maybe go eat a snack while it's installing?).


## Configuring a WM

Now that you have your favorite WM installed, what next? If you're hardcore, you probably already have a repository with your dotfiles and configs all ready to go, but what about an un-configured WM? Well, it will probably be *functional* in terms of managing windows, but it probably requires a lot more work to get it to do anything useful. You'll be stuck editing config files for several hours to get something on the level of a desktop environment. All desktop environments ship with a settings app to modify essential settings such as monitors and such. Using a WM? Well, good luck with `xrandr`, although it's not *too* hard. Now what about screen scaling? Now you have to edit `.Xresources`! And what about adjusting the screen color to make it easier on your eyes? Oops, you'll need a separate program to do that! It's orders of magnitudes nicer to have all of these common tweaks in one place, in a DE.

I'm going to use the example of KDE Plasma some more, since it exemplifies a nice, well-rounded desktop environment. One of the key benefits of Plasma is its excellent integration with the KDE application suite. Sure, not every DE has a very complete set of applications, but it's loads better than anything you can do with a WM, in addition to a drastically lower amount of tedious work to set everything up.

The most common criticism of desktop environments is that they are "bloated" and "resource-hogging". And yes, I'm going to have to concede this one to the WM fans, since window managers tend to be very spartan and minimalistic. I even use i3 sometimes when working with very intensive software, such as with the macOS VM. But every time I use i3, I'm constantly reminded of the Plasma features that I take for granted: a consistent icon theme, screen scaling for my high DPI monitor so the text can actually be legible, adjusting the screen color, mouse scroll direction, Krunner, and much more. Never forget Krunner. The single most important KDE app. Too bad it's glitchy with i3. I did end up fixing some of those things, but it doesn't feel *right*. I could put in more time, but there's just something *missing* about i3. It's incomplete.

If you go on Reddit or do a DuckDuckGo search, you'll find plenty of examples of beautiful, heavy-customized WM setups. The emphasis on heavy-customized. It takes hours and hours of work to create something like that! Sure, you can download their dotfiles and set it up on your own computer, but it still doesn't feel quite the same as using a mature, well-rounded DE like KDE Plasma. Desktop environments are designed to make your life easier, even if it doesn't feel like it sometimes. WMs are really for people who have too much time on their hands and *need* that ultimate customizability. For everyone else, stick with your desktop environment.


## What about using [i3 with Plasma](https://userbase.kde.org/Tutorials/Using_Other_Window_Managers_with_Plasma)?

Meh. Kwin is pretty good and does dazzling compositing effects. Too bad it can't tile.

