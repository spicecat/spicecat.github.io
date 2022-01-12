---
title: "The Anti Window Manager"
date: 2021-06-22
type: "post"
tags: ["Linux", "Rant"]
---


*Originally posted on my [old blog](https://git.exozy.me/Ta180m/blog/src/branch/main/_posts/2021-06-22-anti-window-manager.md)*


[KDE bloat](/posts/myth-bloat), [WMs rule](/posts/why-wms-suck). Therefore, we must use get rid of the DE in KDE and we are left with... everyone's favorite WM, [KWin](https://userbase.kde.org/KWin)!

There are only three easy steps. First, set up the environmental variables and start up D-Bus:

```sh
export $(dbus-launch)
export QT_QPA_PLATFORM=wayland
```

Now enjoy your super unbloated standalone compositing Wayland window manager with `kwin_wayland konsole`. Need XWayland? To add that extra bloat, just pass the `--xwayland` flag.

![KWin standalone](/images/kwin-standalone.png)

All set! Now you can flex your very unbloated WM in all of its glory. It's Wayland, too! Now try getting some work done...
