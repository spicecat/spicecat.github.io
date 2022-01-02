---
title: "Make Wayland Scaling Less Painful"
date: 2022-01-01T20:51:58-06:00
description: "A small fix to improve Wayland scaling for 4K displays"
type: "post"
tags: ["linux", "kde", "wayland"]
---


Wayland is awesome. It supports my 4K 60Hz monitor out-of-the-box without any Xorg configuration or custom EDID file hackery. Even [gaming on Wayland](https://zamundaaa.github.io/wayland/2021/12/14/about-gaming-on-wayland.html) more or less works.

There's only one problem or I would have ditched Xorg forever.

Everything on the 4K monitor is really really tiny! You might say, why not just apply some scaling? After all, KDE Plasma has great fraction scaling support and just works™ on Xorg. The problem is that Wayland apps scale perfectly but XWayland apps... not so much. There's been [merge requests](https://gitlab.freedesktop.org/xorg/xserver/-/merge_requests/733) for three years now to fix this, but nothing much has happened to improve the situation.

Of course, most of the apps I use support Wayland anyways... except for games. And games are the whole reason for using the 4K 60Hz monitor!

So I basically have three options here: destroy my eyeballs by having to look at tiny text and windows, run the monitor at a lower resolution like 1080p and destroy the 4K experience, or use scaling and have to suffer blurry XWayland apps and games.

Actually, there's a fourth option. Instead of scaling everything, why not just scale text by forcing a high font DPI? Windows and icons will still be tiny, but at least you'll be able to read the text! KDE Plasma conveniently has an option in the font settings to do this, and I'm sure other DEs and [WMs](/posts/why-wms-suck/) have similar settings.

So there you have it: forcing the font DPI doesn't scale things perfectly—in fact it's far from perfect and buggy sometimes—but it's better than straining your eyes to look at tiny text all day. Hopefully this makes your Wayland experience much more enjoyable.
