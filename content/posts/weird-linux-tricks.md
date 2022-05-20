---
title: "Weird Linux Tricks"
date: 2020-12-23
draft: true
type: "post"
tags: ["Random", "Linux"]
---


*Originally posted on my [old blog](https://git.exozy.me/Ta180m/blog/src/branch/main/_posts/2020-12-23-weird-linux-tricks.md)*


## Impress your friends with one weird trick!

Linux is pretty tricky. Here are a few actually useful tricks.


## GDB GUI, or should I say TUI

I've got some mixed feelings about VSCodium, the text editor that I use. It's not bad, but as an Electron app, it predictably has terrible performance issues. For instance, compiling a tiny C++ file can take 10 times as long in VSCodium versus compiling it in the terminal. However, one thing that it does great, with the help of the phenomenal extension [Native Debug](https://github.com/WebFreak001/code-debug), is the excellent (although slow) integrated graphical debugging experience, using `gdb` as the backend. People often decry GUIs for being bloated and not much more useful than the command line, but in this case, the graphical debugger helps me keep track of where I'm at in my code. ([Try watching videos in your terminal](/blog/2020/10/28/random-tidbits.html)) Anyways, I've been trying to find a replacement, but no other editor seems to have this nice integration. Then I found out that `gdb` has its own GUI. Or more accurately, a TUI. Just run `gdb` with the `--tui` switch and it should start up with a split screen, with your code at the top and the `gdb` command line at the bottom. Perfect! 

![GDB Tui](/blog/assets/gdb-tui.png)


## `ip` color

`ip` is one of those commands that always spits out a heap of output, even when I just want something as simple as my IP address. OK, networking is hard, but still, no need to give me several pages of output. Color is here to save the day. Try `ip address` versus `ip -c address` and see for yourself!


## Go home

Easy. `cd`. That's it. No aliases needed; should work in basically any shell.


## Sparse files

Sparse files are pretty much black magic. Enough said. Basically, only used space is allocated, so a 14TB file containing all zeroes can be represented with no additional storage. You can have all the 14TB files that you ever want!

![A 14TB file](/blog/assets/sparse-file.png)

Here's a 7 exibyte file, produced using [this technique](https://rwmj.wordpress.com/2020/11/04/ridiculously-big-files/). Now you can brag to four friends about your 7 exibyte hard drive!

![A 7EiB file](/blog/assets/ridiculously-big-file.png)

