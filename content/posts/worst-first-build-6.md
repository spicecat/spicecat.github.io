---
layout: post
title:  "Worst First Build - Homelab Operational!"
author: Ta180m
tags: ["Hardware", "Linux"]
---


Over the past week, I've been getting my new build set up. It's been quite satisfying: I'll run into more than my fair share of issues, but problem solving for the win!

The OS installation went relatively smoothly. Partitioning disks was a bit tricky but I got it to work. I wanted to try out `systemd-networkd` and `systemd-boot` for my new server, and I had to spend some time researching documentation. One of them worked perfectly, the other one not so much, so I ended up sticking with the tried-and-true NetworkManager. I also got SSH and VNC working as well, so I was off to great start.

My first major headache was XMP. To but it simply, enabling XMP always caused me to fail to boot, so something was definitely wrong. I tried various voltages and frequencies, at the highest I could get it to go was 3533MHz, just 66MHz below my RAM's rated speed.

After coming through online forums and dozens of Reddit posts, I finally found a solution. An anonymous Redditer suggested changing VDD_SOC to 1.00 V to someone with a similar solution, so I gave it a try. Bingo! It worked and my RAM crushed the [RAMspeed](https://openbenchmarking.org/test/pts/ramspeed) benchmark.

Next! My next challenge was to set up Nextcloud. Fortunately, ArchWiki has a [nice guide](https://wiki.archlinux.org/index.php/Nextcloud), updated and refactored for Nextcloud 21 and there are some other [good ones](https://thepenguin.eu/2018-06-17-how-to-set-up-your-own-cloud-using-nextcloud-on-archlinux/) out there, so that went surprisingly smoothly as well. I also had to obtain a domain for my server, but the [GitHub Education Developer Pack](https://education.github.com/pack) came to the rescue! The most difficult part was probably SSL certificates since I'll never done it before, but it worked out in the end. `certbot` for the win!

Anyways, my biggest challenges still lied ahead. Matrix.

[Matrix](matrix.org/) is a great protocol. There's a nice [public homeserver](matrix.org/) that you can try and get your friends to sign up for. But still, it's public and owned by someone else. Plus, you can't run some bridges with it. So, that left me with the seemingly easy task of setting up my own homeserver.

Way easier said than done. Installing the reference homeserver, Synapse, is straight up hellish. The ArchWiki was marginally helpful. The official documentation was too terse. It didn't make my life easier that I wanted to configure [delegation](https://github.com/matrix-org/synapse/blob/develop/docs/delegate.md) to run my homeserver on a subdomain but show as running on the main domain, but I finally found a [guide](https://ajl.io/matrix-synapse-server-setup-guide/) that would help me do it.

It took... a while. I ran into numerous problems, ranging from forgetting to `cd` into `/var/lib/synapse` for the homeserver installation to having SSL certificate problems that I finally fixed by issuing one for all my subdomains. Phew. I still had one big challenge still remaining.

The [https://en.wikipedia.org/wiki/Network_effect](network effect) sucks. All my friends use Discord. Fortunately, I had picked Matrix partly due to its strong bridge support. I tried giving [mx-puppet-discord](https://github.com/matrix-discord/mx-puppet-discord) a shot and it worked perfectly!

However, there's also a package for it in the [AUR](https://aur.archlinux.org/packages/mx-puppet-discord-git/) that comes with some extra goodies such as a systemd service. What comes next? Well, I'll quote my post on the AUR exactly:

> For some reason, after editing `/etc/mx-puppet-discord/config.yaml`, when I run `node /usr/lib/node_modules/mx-puppet-discord/build/index.js -c /etc/mx-puppet-discord/config.yaml -r -f /root/registration.yaml` as root, the command never stops running. Checking my active processes, it doesn't even seem like node is doing anything. The same thing happens with `node /usr/lib/node_modules/mx-puppet-discord/build/index.js -h` which should print the help message. Does anyone know why this is happening? Perhaps something is wrong with my node installation?
> 
> EDIT: I generated a `registration.yaml` using the instructions in the GitHub repository, and now when I try to start `mx-puppet-discord.service`, I get the error `Failed at step NAMESPACE spawning`.
> 
> EDIT 2: I finally got the original GitHub repository to work. I don't know what's wrong with this package though.
> 
> EDIT 3: I figured out how to fix the `systemd` error: Turns out you need to manually create the `/var/lib/mx-puppet-discord` directory.
> 
> EDIT 4: Finally got a working setup! I first cloned the repo directly from GitHub, configured it, transferred ownership to the `mx-puppet-discord` user and reused the systemd service. Now it works perfectly!
> 
> EDIT 5: Synapse wasn't starting up fast enough on boot for `mx-puppet-discord`, so I had to add `ExecStartPre=sleep 5` to the service file for it to work after a reboot.

So there you go. That's how you set up mx-puppet-discord, after hours of problem solving.

I also set up Gitea to mirror my GitHub repositories, but nothing notable happened with that.

