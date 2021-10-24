---
layout: post
title:  "Does Windows Really Suck?"
author: Ta180m
tags: ["Linux", "Windows"]
---


Well, obviously yes.

But recently, I heard about official support for [GUI apps in WSL](https://docs.microsoft.com/en-us/windows/wsl/tutorials/gui-apps), so I thought I'd give it a try. Plus, my computer is on the [Windows Insider dev channel](/blog/2021/01/06/windows-update.html), so I have to boot up and update Windows every few months anyways.

So I booted up Windows for the first time in a few months, and it was... slow. That's all that I can describe it as. After you get used to the speed of KDE Plasma, Windows feels like an ill, lethargic sloth or something. It was painfully slow and my computer's fans spun at maximum volume much of the time. It didn't help that there was a ton of stuff that needed updating, and the whole process took at least an hour. At least I can update most of the crap apps through the Windows store... which is slower than Yuzu emulator. At least emulators have to try to run games at a reasonable speed; the Windows store just wastes as much of your time as possible while also bombarding you with stupid app recommendations on the home page. I also had to install some beta drivers for my GPU to support WSL, which required some Device Manager trickery to get it to work. For some reason, Firefox updated to a beta version, which looked gorgeous, but that's a story for another post.

Then I had to reboot to install the latest Windows update for WSL GUI apps, of course, and that took another hour.

Whew! Got that out of the way! I disabled Windows Defender, Office Click-to-run, and half a dozen other services that kept on using up all my CPU in the meantime using a variety of registry and CMD hacks. After I finished cleaning up Windows, it's time to enjoy WSL GUI apps!!

Except... they didn't work. I tried running `wsl --update` more times than I could count. Not wanting to waste more time, I nuked my WSL installation and reinstalled it from the stupid Windows store.

And then, finally, after all those hours, WSL GUI apps finally worked. It was very anticlimatic; basically the same thing as VcXsrv in its multiple windows mode, but with some extra perks.

I wish I took some screenshots, but I don't want to boot into Windows again and suffer more.

WSL is awesome, and I'm sure a lot of work must have been put into making it so integrated. But the raw crap that is Windows prevents the experience from being very enjoyable, whether it's random Windows processes using up 100% CPU all the time, or taking two hours to update, or the general "It just (doesn't) work™" feeling that seemed to bog down the whole experience.

An interesting sidenote: [WSLg](https://devblogs.microsoft.com/commandline/wslg-architecture/), the graphics system for WSL, uses a VM of [CBL-Mariner](https://github.com/microsoft/CBL-Mariner), one of Microsoft's internal Linux distributions. With all the work being put into WSL, could that mean a consumer Linux distro from Microsoft is coming soon, and free us all from the trash that is Windows? We can only dream...

