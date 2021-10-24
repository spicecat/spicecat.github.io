---
layout: post
title:  "Self-hosting Sucks"
author: Ta180m
tags: ["Linux", "Rant"]
---


After one month of self-hosting, if there's one thing I've learned, it's that self-hosting sucks. As I've said in a [previous post](https://ta180m.github.io/blog/2021/04/08/self-hosting-is-not-the-solution.html), self-hosting is not the solution to our privacy woes. So why exactly does it suck so much? Here's a short timeline of the past month:

 - My Discord-Matrix bridge goes down over a weekend and I don't find out for several days. When I try to restart it, I get all sorts of weird Node.js errors about better-sqlite3. After hours of trying to fix it, I finally just remove all occurrences of SQLite from the code since I use PostgreSQL anyways.

 - Nextcloud Mail stops working. I finally filed an [issue](https://github.com/nextcloud/mail/issues/5007) on their GitHub repository and it turns out it was PHP 8.0.5's fault. Updating it fixed my problem. Who would have thought?

 - Collabora CODE is super sluggish. Nextcloud's built-in CODE server happens to be a joke, but setting up a standalone server isn't trivial, either. Compounded with terrible documentation, you have the perfect recipe for a wasted day of debugging!

 - Grafana/Zabbix really sucks. Bad documentation strikes again! This one wasted at least six hours...

 - NFS is terrible. Why do we have to edit `/etc/fstab` like it's the 1990s? Why?

Of course, a few good things happened, too. I finally got "DIY cloud gaming" to work a lot better, by using X forwarding and VirtualGL. `vglconnect` is the best remote desktop app I've ever used. I even got sound to work with `PULSE_SERVER=client_ip_address`! Yes, FlightGear works and isn't super laggy somehow, osu! works with `pulseaudio-alsa` so the nefarious PulseAudio can hijack the role of ALSA, the cursor capture in Minecraft and Minetest isn't all weird like it is in VNC, and, of course, I can get a decent FPS in SuperTuxKart now. Yay for gaming, not so much for all the other broken and badly designed and badly documented stuff.

