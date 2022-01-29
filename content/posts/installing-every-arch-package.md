---
title: "Installing Every Arch Package"
date: 2022-01-26T21:52:58-06:00
description: "How I installed as many packages as possible from the Arch Linux official repositories"
type: "post"
tags: ["linux", "fun"]
---


![A stupid idea on Matrix](/images/install-every-arch-package-matrix.png)

When I saw that, I instantly thought: Challenge accepted. It's a delightfully dumb idea, but is it really possible?

First things first, let's generate a list of all official Arch Linux packages. Fortunately, `pacman`, the best pragmatic package manager in existence, makes this a breeze.
```sh
pacman -Slq
```

Great, now let's install it all!
```sh
pacman -Slq | xargs pacman -S --debug
```

10 seconds later, you'll find yourself with... unresolvable package conflicts detected?

Thankfully, most of the conflicts can be easily resolved by choosing either one of the conflicting packages (for instance, `wine` and `wine-staging`), and no other package depends on specifically one or the other package, so we're OK!

However, we probably don't want to go through each one of the conflicts manually and fix them ourselves. In particular, how will we know our choices give an optimal answer and install the most number of packages possible?

## Weird maximum independent set stuff

This problem is a graph problem! Specifically, it's a weird maximum independent set problem!

