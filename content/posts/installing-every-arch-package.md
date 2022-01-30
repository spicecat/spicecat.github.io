---
title: "Installing Every Arch Package"
date: 2022-01-26T21:52:58-06:00
description: "How I installed as many packages as possible from the Arch Linux official repositories"
type: "post"
tags: ["linux", "fun"]
---


![A stupid idea on Matrix](/images/install-every-arch-package-matrix.png)

Challenge accepted. Let's do it!

First things first, let's generate a list of all official Arch Linux packages. Fortunately, `pacman`, the best pragmatic package manager in existence, makes this a breeze.
```sh
pacman -Slq
```

Great, now let's install it all!
```sh
pacman -Slq | xargs sudo pacman -S
```

10 seconds later, you'll find yourself with... unresolvable package conflicts detected?

OK, fine, let's disable dependency checking then:
```sh
pacman -Slq | xargs sudo pacman -Sdd
```

Nope, didn't work. We have to do something about the conflicting packages!

Since we don't care about making the dependencies all work out nicely, we just need to choose the larger package out of the two in each pair of conflicting packages. We have to give special treatment to `tensorflow`, `tensorflow-opt`, `tensorflow-cuda`, and `tensorflow-opt-cuda`, since they all conflict with each other, but we'll simply choose `tensorflow-opt-cuda` because it's the most bloated.

It's possible to programmatically do this, but that's left as an exercise to the reader. Plus:

![Automation](https://imgs.xkcd.com/comics/automation.png)

Alright, time to install it all!
```sh
pacman -Slq | sed -E '/^(tensorflow|tensorflow-opt|tensorflow-cuda|python-tensorflow|python-tensorflow-opt|python-tensorflow-cuda|blas|python-h5py|python-gast|python-mistune|python-netcdf4|netcdf|python-pytorch|python-sqlalchemy|qtcurve-qt5|quassel-client|quassel-monolithic|racket-minimal|root|rssguard-nowebengine|srslte|tldr|ttf-nerd-fonts-symbols|vbam-sdl|vhba-module|virtualbox-guest-utils-nox|virtualbox-host-modules-arch|xarchiver|xrootd|yabause-gtk|zathura-pdf-poppler|lib32-pipewire-jack|wine|fcron|man-db|pipewire-jack|libreoffice-still.*|llvm11|msmtp-mta|perl-mail-spf|pipewire-media-session|exim|opensmtpd|nullmailer|plan9port|acpi_call-lts|broadcom-wl|clash)$/d' | xargs sudo pacman -Sdd --noconfirm
```

This is going to be *fun*:
```
Total Download Size:   11420.54 MiB
Total Installed Size:  37363.60 MiB
```

Time to take a break while it downloads...

