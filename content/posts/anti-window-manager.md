---
layout: post
title:  "The Anti Window Manager"
author: Ta180m
tags: ["Linux", "Rant"]
---


[KDE bloat](/blog/2021/06/04/myth-bloat.html), [WMs rule](/blog/2020/12/26/why-wms-suck.html). Therefore, we must use get rid of the DE in KDE and we are left with... everyone's favorite WM, [KWin](https://userbase.kde.org/KWin)!

There are only three easy steps. First, set up the environmental variables and start up D-Bus:

```sh
export $(dbus-launch)
export QT_QPA_PLATFORM=wayland
```

Now enjoy your super unbloated standalone compositing Wayland window manager with `kwin_wayland konsole`. Need [XWayland](/blog/2020/04/21/wayland-is-a-scam.html)? To add that extra bloat, just pass the `--xwayland` flag.

![KWin standalone](/blog/assets/kwin-standalone.png)

All set! Now you can flex your very unbloated WM in all of its glory. It's Wayland, too! Now try getting some work done...
