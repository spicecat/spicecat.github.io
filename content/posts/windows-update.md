---
title: "How Windows Update Saved My Computer from... Windows Update"
date: 2021-01-06
type: "post"
tags: ["Windows", "WSL"]
---


*Originally posted on my [old blog](https://github.com/Ta180m/blog/blob/main/_posts/2021-01-06-windows-update.md)*


If I had to name the single thing that I most hate about Windows, it would probably be Windows update. I have a long and complicated history with Windows update. Throw in [Windows Insider](https://insider.windows.com/), and you have the perfect recipe for disaster!


## A close encounter

So my experience with Windows update begins about two or three years ago, when I noticed the cute ninja cat of Windows Insider lounging at the bottom of the Updates panel in the Windows 10 settings app. (Check for yourself! It's a ninja cat.) Curious, I clicked on it, and I was piqued by the thought of "exploring new Windows features" and such. Well, they say curiousity killed the (ninja) cat, and my first Insider build that I installed wasn't exactly the most stable thing. Yeah, I got a GSOD (I completely freaked out) and hurriedly reverted back to a regular build. Anyways, I stayed away from Insider for a while.


## The disaster really begins

Eventually, stories about Insider's spectacular WSL 2 support drew me back, and soon, I was back on an Insider build. [19603](https://blogs.windows.com/windows-insider/2020/04/08/announcing-windows-10-insider-preview-build-19603/) to be exact. Ironically, WSL 2 was added to regular Windows not long after, but anyways, 19603 was surprisingly stable. No crashes. No GSODs. Maybe a few minor graphical glitches occasionally, but I was enjoying WSL 2.

Then, new stories emerged. OpenGL GPU support in WSL 2! Or some combination of buzzwords to that effect. I was hooked. I needed that new Insider build, number [20161](https://blogs.windows.com/windows-insider/2020/07/01/announcing-windows-10-insider-preview-build-20161/). (Actually, GPU support might have been added in a previous build, but I didn't hear about it until after they released 20161) And 20161 was, as you might expect, pretty unstable. I think I got at least three GSODs during a few days of usage, so I impatiently waited for the next build to drop.

This was the one that killed my PC. Build [20180](https://blogs.windows.com/windows-insider/2020/07/29/announcing-windows-10-insider-preview-build-20180/). I don't know what happened. Maybe it was because I left Windows alone to update for a few hours, and came back to see it totally wrecked. Maybe it was because I used some [DSIM hacks to enable Hyper-V on Windows Home](https://github.com/Ta180m/Windows/blob/master/hyper-v.bat). Maybe my RAM had a memory error in the middle of the update. Maybe a bit flipped somewhere and derailed everything. But whatever the cause was, Windows was in a *very* bad shape after the update.

Yeah. That was one of the reasons, probably the most down-to-earth reason, why I switched to Linux. The USB ports started acting weirdly, I experienced popups telling me stuff was wrong with Task Manager, when installing software it would fail in the middle for no reason, and a lot more. My NVIDIA graphics card was no longer detected by Windows `DSIM` and `SFC /scannow` stopped working. When they said unstable, I didn't know this was what could happen.

I tried a lot of stuff. I tried searching up my problems online. No help. I tried to update Windows to the next build, but it kept on failing in the middle. No help. So, I did the logical thing: switch to Linux, and I've been pretty happy ever since. No of the problems ever followed me to Linux. (Of course, the NVIDIA card gives me plenty of problems on Linux, but they aren't related to ones I was having with Windows)

But something was still bugging me. A few weeks ago, I recieved another email from Windows Insider telling me to update my build, since it was no longer going to be supported. If I didn't update by January 21 (or something like that) I wouldn't be able to boot up Windows!

I was stuck. I didn't know what to do. Reinstall Windows? I didn't want to go through the trouble. After all, I never use Windows except for the occasional gaming. So, I tried my last resort: Windows update.


## Windows update to the rescue!

Yes, Windows update, the very same thing that had crippled my PC. Many of the online guides had recommended trying to update Windows to solve some of the problems that I was having. Since my build was expiring, I decided that it wouldn't hurt to try, other than wasting two hours of my time.

I started by moving some large files out of my Windows partition to ensure there was sufficient space during the update. Then, I enabled the "optional telementry" that must be enabled for downloading Insider builds and got started. The update lasted around 90 minutes. It stalled for a while at certain percents several time, but it eventually completed. Somehow.

When it was done, I logged back in, and it did the usual "Hi." ritual. Finally, it dropped me back on to my desktop, and I tested a few things to see if my Windows installation had been fixed. Nothing suspicious or weird happened, which was definitely a relief. OK, so it looked good so far. It also felt a lot faster and smoother, but that was probably because I disabled Windows Defender. (I don't need it if I only use Windows to play a few games once a month)

I've been on build [20279](https://blogs.windows.com/windows-insider/2020/12/14/announcing-windows-10-insider-preview-build-20279/) for several days now. Since I rarely use Windows, I don't know the full extent of its stability or lack of stability, but it seems like *all* of my problems from before have been fixed. Weird.

One final observation: How come proprietary operating systems still take forever to do updates? Can't they learn from Linux? Why do they need to take 90 minutes even for updating from one build to the very next one? Sure, I can excuse it if it's one update every six months because a lot could have changed (Ubuntu version updates also take a while) but Windows shouldn't have needed 90 minutes for something like build 20161 to 20180. And that update seriously broke my computer. Well, it looks like my latest build 20279 won't expire until October, so I might just procrastinate the next update until then.

