---
layout: post
title:  "Plasma 5.22 is a Disappointment"
author: Ta180m
tags: ["Linux", "KDE", "Rant"]
---


The KDE Plasma update train has cycled back again to another major update, so I snatched Plasma 5.22 from the very scary [testing repository](https://wiki.archlinux.org/index.php/Official_repositories#Testing_repositories), took it for a spin, and it's... disappointing.

What's the big new feature this time? Adaptive transparency, apparently.

Adaptive what?

Yeah, if you were expecting something big, another huge leap forward, this update was anything but that. If you think panel transparency is a big deal, think again.

However, Plasma 5.22 did manage to shrink the clock on the panel, so it's now harder to read. Of course, the screenshot below still makes it seem big.

![The clock shrunk!](/blog/assets/clock.png)

Also, there was a "Reboot to apply updates" icon in the system tray after every boot that started showing up, but the following commands fixed it. Warning: it will reboot your computer.

```sh
sudo pkcon update -d
sudo pkcon offline-trigger
sudo systemctl start packagekit-offline-update
```

Other minor annoyances include Yakuake flashing blue every time you close it. Definitely annoying, but not a serious issue.

We did get another cool wallpaper though! So I guess it was a net benefit if you factor that in...

