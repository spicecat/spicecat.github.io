---
title: "The Linux Office?"
date: 2020-12-25
type: "post"
tags: ["Linux", "Windows"]
---


*Originally posted on my [old blog](https://github.com/Ta180m/blog/blob/main/_posts/2020-12-25-linux-office.md)*


![LibreOffice hate](/images/libreoffice-hate.png)

OK, LibreOffice may not be the most loved application out there, but it's enough for most people. I use LibreOffice even on Windows! However, there is one thing about it that bothers me: the hideous icons! At first, I thought it might be caused be anti-aliasing or my screen scaling (currently set at 1.5x so everything's not tiny) but nope! The icons stayed hideous no matter what I did. Finally, after a bit of digging around in the settings, I found the root cause:

![LibreOffice icon settings](/images/libreoffice-settings.png)

Can you see it? The icon style was set to `Breeze`, which presumably uses bitmap icons, while I was in fact looking for the infinitely scalable `Breeze (SVG)` vector icons. Switching to vector icons did the trick, and now LibreOffice doesn't look hideous anymore! The question is, why is the default the ugly bitmap icons?

![LibreOffice icons](/images/libreoffice-icons.png)

People bash LibreOffice all the time for its imperfect compatibility of Office documents, but the important thing to remember is that *LibreOffice is not Microsoft Office!* If LibreOffice had focused less on being a Office clone and more on developing its own unique features, it would probably be in a much better shape right now. Millions of people are still using the basically-abandoned OpenOffice in 2020!


## But I need Microsoft Office!

Fine. Well, here are the latest developments. Traditionally, you had the two options of Wine, the compatibility layer, or going the VM route. Both suffer from their own flaws: Wine compatibility isn't perfect enough for Office, and VMs are resource-intensive, even if you want to make a few quick edits to a doc, and lack good graphical acceleration. [WinApps](https://github.com/Fmstrat/winapps) will give you the best of both worlds: the seamlessness of Wine, and the compatibility of a VM, well, using a QEMU/KVM VM. WinApps runs a background RDP server and integrates the VM apps into your host desktop. If Wine is the analog of WSL, then WinApps is WSL2. The only problem is that it's a just a VM underneath, so you still get all the disadvantages of VMs. Still, if you have some RAM to spare, it might be enough to free your dependency on Windows for Office or Adobe apps. It's still under heavy development, so we'll see where it goes.

![WinApps demo](https://raw.githubusercontent.com/Fmstrat/winapps/main/demo/demo.gif)

Anyways, Microsoft Office is probably the single biggest app that's preventing competent people who want to use Linux from using it full time. Sure, there's also the online cloud version, which you can use with an [Electron wrapper](https://github.com/matvelloso/electron-office) but it's not the same as a native app. LibreOffice is also great and enough for most everyone, but as I said before, *LibreOffice is not Office*, no matter how hard it wants to believe that it's an Office clone. Maybe WinApps will be a step in the right direction. We'll see.

