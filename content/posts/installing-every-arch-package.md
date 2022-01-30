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
pacman -Slq | xargs sudo pacman -S --debug
```

10 seconds later, you'll find yourself with... unresolvable package conflicts detected?

At the time of this writing, there are 51 conflicting packages, and it's definitely possible to go through each conflict and manually resolve it. However, who wants to waste 10 minutes of their life doing that, and even worse, how will we know our choices give an optimal answer and installs the most number of packages possible?

![Automation](https://xkcd.com/1319/)

## Time for some algorithms!

This problem is "just" a graph problem! And it's not just any general graph, but a very special one! We'll start by making some assumptions to make our life a bit easier.

The first assumption is that each package is in at most one conflict. Yeah, yeah, that's not actually true here since `tensorflow`, `tensorflow-opt`, `tensorflow-cuda`, and `tensorflow-opt-cuda` all conflict with each other, but we'll manually resolve these conflicts ourselves. In this particular case, we'll choose `tensorflow-opt-cuda` since it's the most bloated.

So that makes our killer installation command now:
```sh
pacman -Slq | sed -E '/(tensorflow|tensorflow-opt|tensorflow-cuda)$/d' | xargs sudo pacman -S --debug
```

Awesome, we've now got it down to only 26 conflicts, not counting duplicates!
```
debug: package python-h5py conflicts with hdf5-openmpi (by hdf5-openmpi)
debug: package python-gast03 conflicts with python-gast (by python-gast)
debug: package python-mistune1 conflicts with python-mistune (by python-mistune)
debug: package python-netcdf4-openmpi conflicts with python-netcdf4 (by python-netcdf4)
debug: package netcdf-openmpi conflicts with netcdf (by netcdf)
debug: package python-pytorch-cuda conflicts with python-pytorch (by python-pytorch)
debug: package python-sqlalchemy1.3 conflicts with python-sqlalchemy (by python-sqlalchemy)
debug: package qtcurve-kde conflicts with qtcurve-qt5 (by qtcurve-qt5)
debug: package quassel-client conflicts with quassel-client-qt (by quassel-client-qt)
debug: package quassel-monolithic conflicts with quassel-monolithic-qt (by quassel-monolithic-qt)
debug: package racket-minimal conflicts with racket (by racket)
debug: package root-cuda conflicts with root (by root)
debug: package rssguard-nowebengine conflicts with rssguard (by rssguard)
debug: package srslte-avx2 conflicts with srslte (by srslte)
debug: package tealdeer conflicts with tldr (by tldr)
debug: package ttf-nerd-fonts-symbols conflicts with ttf-nerd-fonts-symbols-mono (by ttf-nerd-fonts-symbols-mono)
debug: package vbam-sdl conflicts with vbam-wx (by vbam-wx)
debug: package vhba-module-dkms conflicts with vhba-module (by vhba-module)
debug: package virtualbox-guest-utils conflicts with virtualbox-guest-utils-nox (by virtualbox-guest-utils-nox)
debug: package virtualbox-host-modules-arch conflicts with virtualbox-host-dkms (by virtualbox-host-dkms)
debug: package xarchiver-gtk2 conflicts with xarchiver (by xarchiver)
debug: package xrootd4 conflicts with xrootd (by xrootd)
debug: package yabause-gtk conflicts with yabause-qt (by yabause-qt)
debug: package zathura-pdf-mupdf conflicts with zathura-pdf-poppler (by zathura-pdf-poppler)
debug: package lib32-jack2 conflicts with lib32-pipewire-jack (by lib32-jack)
debug: package wine-staging conflicts with wine (by wine)
```

pacman -Slq | sed -E '/(tensorflow|tensorflow-opt|tensorflow-cuda|python-h5py|python-gast|python-mistune|python-netcdf4|netcdf|python-pytorch|python-sqlalchemy|qtcurve-qt5|quassel-client|quassel-monolithic|racket-minimal|root|rssguard-nowebengine|srslte|tldr|ttf-nerd-fonts-symbols|vbam-sdl|vhba-module|virtualbox-guest-utils-nox|virtualbox-host-modules-arch|xarchiver|xrootdd|yabause-gtk|zathura-pdf-poppler|lib32-pipewire-jack|wine)$/d' | xargs sudo pacman -S --debug