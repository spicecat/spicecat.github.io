---
layout: post
title:  "DIY Cloud Gaming"
author: Ta180m
tags: ["Linux"]
---


Cloud gaming sucks. Here's [Wikipedia's summary](https://en.wikipedia.org/wiki/Cloud_gaming) of its many flaws:

> This approach provides several disadvantages, notably forcing the user to consistently maintain a high-speed internet connection to an external organization. This built-in barrier to entry not only locks out users who wish to play video games in areas without this internet connection, but also precludes the player from owning their personal copy of the software, and permanently locks the user into a rental agreement, tying the purchase of the game to the solvency of the streaming provider (if the company goes out of business, the game ceases to exist). It is also inherently wasteful, and has insurmountable lag built-in to the distribution model, forcing users to make connections to potentially geographically-distant servers for the sole purpose of sending command inputs and retrieving video and audio streams that are viewed once and then immediately discarded.

But what's lesser known is that you don't need Geforce Now, Stadia, or Moonlight. It's actually possible—and pretty easy—to roll out your own DIY cloud gaming solution using only Linux and open-source apps. Alright, let's get started!

First, let's figure out how we're going to do remote desktop. There's X forwarding, VNC, xrdp, X2Go, and more, but in my own experience, X forwarding works by far the best over a LAN. Gaming over the internet? None of these protocols are optimized well for low latency, so I guess just try all of them and see which one is best. I've had some success with gaming using VNC from another location in the same city, but if your server is on the other side of the world, YMMV.

Great, let's start up a game! The first thing you'll notice is that your performance is absolutely trash because you're probably using software rendering. However, [VirtualGL](https://wiki.archlinux.org/title/VirtualGL) is here to the rescue! Now you can enjoy your near-normal FPS again with `vglconnect`, although you'll probably be limited by the FPS of your connection.

OK, so where's the sound? Here's one of the few areas of PulseAudio really shines: you can [select the server to run the sound on](https://wiki.archlinux.org/title/PulseAudio#Networked_audio)! After setup, just set the `PULSE_SERVER` environmental variable and you're all set! The latency is decent on a LAN but not so much over the internet. Whatever.

We're getting pretty close now: all that's left is that I can't game with a keyboard; I need a controller! Fortunately, there's [netstick](https://github.com/moslevin/netstick) to help us out! Putting everything together, we can now enjoy games running on a fast server on our laptops!

The experience of gaming over a LAN is basically the same as running it directly on the client, which is great! However, if you want to compete with Geforce Now and Stadia and game over the internet, their specialized protocols are probably going to perform a lot better. YMMV.

