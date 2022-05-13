---
title: "Laptopia"
date: 2022-05-12T14:03:14-05:00
description: "A semi-serious description of the massive brain damage I suffered from buying and setting up a new laptop"
type: "post"
tags: ["rant", "linux", "hardware", "laptop", "humor"]
---


For the past gazillion (as in, six) years, my loyal companian has been a ThinkPad Yoga 14 Signature Edition (the "Signature Edition" part is the most important, obviously, whatever it means), with the affectionately and creatively named hostname of `ThinkPad Yoga 14`. We've been through, well, basically everything: running macOS virtual machines, accidentally deleting my GPT partition table, nesting 10 Docker containers inside each other, hosting the world's slowest Nextcloud server, and emulating Switch games in Yuzu at 1 fps. It's been a great six years, but my laptop had a dual-core in 2016 and as you might not know, laptops don't magically gain more CPU cores as they age. This ThinkPad wasn't really the fastest thing in the world in 2016, but fast-forward to 2022 and you can see where this is going.

So, I set off to find a worthy successor for `ThinkPad Yoga 14` to reincarnate into. (Joke explanation: Yeah I usually don't explain jokes since it ruins them, but this one is a bit too obscure to go unexplained. A few months ago my neighbor's beagle passed away, but he immediately got another *identical* beagle, so there must have been some reincarnation going on there. By the way the old ThinkPad is still alive and well, and now running Linux Mint!) That obviously meant getting another ThinkPad, which fortunately helped destroy 90% of the choice paralysis going into this decision. Unfortunately, even having two choices makes me end up pondering for eternity the better choice, and I narrowed down which model to get to "only" *five* different choices. At this point, all true nerds would make a spreadsheet and create a score function to compute a composite score for each model, but I did the truly big brain thing: nothing.

I simply waited for one of the models to go on sale, which two of them did after a week, and happily bought the objectively better of the two options (after agonizing for hours about which one was really objectively better). The winner? A mediocre storm black ThinkPad X1 Yoga Gen 6 with a mediocre quad-core CPU, a mediocre 8 GB of RAM, a mediocre 256 GB hard drive, and a touchscreen that somehow works in a TTY. Not bad!

Alright, so I've wasted five hours of my life so far due to this, but it can only get worse from here. I had to do a stupid student verification thing to get a 10% discount, so I gave them my Social Security number and other goodies that they're totally not using for nefarious purposes, and they didn't even give me the discount in the end! I ended up getting the discount some other way, so whatever. Only two hours wasted.

Two days later, I see the same X1 Yoga Gen 6, but with *16* GB RAM and a *512* GB hard drive go on sale and I nearly wanted to... well, you get the idea. Yeah, I was, to put it very lightly, mildly upset, but then I saw that they had changed the student discount to only 5%, so I just gave up at that point. After all, who wants to waste more hours for a laptop and have to hassle with returning the current model and going through all the hoops to get the discount for the better model, and...

Maybe it was a good idea to not waste hours on that, since what came next makes all of this stuff before look like picnic.

I've always regretted using Arch instead of NixOS for the [exozyme](https://exozy.me) server, so when I first saw GNU Guix, I knew that was going to be my next laptop's OS. Like seriously, the glorious Lisp-like Scheme language instead of some weird NIH language in the case of NixOS. Functional package management with rollbacks! Declarative home directory management! I really believe Guix is the most powerful OS out there, period. Specifically, I wanted Guix + KDE Plasma + Wayland + btrfs + disk encryption + PipeWire with all the fancy batteries included. This was going to be a insane: a huge improvement over my old laptop is basically every way. And yeah, it was insane, but it the wrong kind of way.

The first roadblock that anyone installing Guix encounters is that your WiFi card is just not going to work. Guix has a really strong commitment to free software, which is great if you love free software, but bad if you own hardware. OK fine, maybe you bought one of the few dongles that has libre firmware, but modern laptop? No WiFi for you!

Fortunately, [Nonguix](https://gitlab.com/nonguix/nonguix) is here to save the day! Unfortunately, you have to compile an installation image yourself. I trust [some random 3rd-party](https://github.com/SystemCrafters/guix-installer/releases/) more than I trust my competence, so I downloaded that image off the internet (great time-saving trick, that image totally isn't malicious!) and booted it up. Sure enough, I had WiFi now! I went through the installation, and after watching the Guix package manager crawl through the installation slower than a moving glacier (Did I mention Guix would get lapped multiple times by any other package manager in a footrace?), I rebooted into a my new Guix system!

And... there was no WiFi!!!

Apparently the Nonguix image doesn't actually install the proprietary firmware by default *even though the image itself contains them*, because whoever designed it was an absolute genius. Oh yeah, I should also mention that Guix doesn't actually have KDE packaged yet, so I was stuck with AwesomeWM which I have absolutely no idea how to use, and the open terminal button when you right click did nothing since I didn't have `xterm` installed.

So there goes another ten hours of my time, since you have to do a insanely slow `guix pull` in the Nonguix image for it to actually pull the proprietary firmware from the Nonguix channel. That takes about half an hour each time, and I messed up quite a few times. I also had the bright idea of trying to make my own custom writable installation image hoping it wouldn't have the fatal flaw of not actually installing the proprietary firmware even though I clearly knew my plan wouldn't work, and that drained another two hours of setting up a Guix VM and compiling the Linux kernel a few times and waiting half an hour to `dd` the installation image onto a USB 2.0 drive. When I actually booted up the USB 2.0 drive, it was slower than tectonic plate movement so I just gave up with that idea.

Eventually, I succeeded because a monkey slamming random keys would be able to install Guix succesfully at some point. I rebooted into the new system and tried logging in. Nope, didn't work. I tried typing in my password again. Nope. Tried again. Still no.

Thinking I had just mistyped it and gotten locked out, I waited for a while before thinking of the actual logical solution of logging into the root user, which worked without a password! So much for security...

Well actually, I had just forgotten to set a root or user password during the installation, so oops.

It dropped me right into AwesomeWM, which I still don't know how to use, so I just installed some other useful packages like `xterm` (for a functional AwesomeWM) and `vim` so I had an actually useful text editor instead of `nano`. A few more hours later of attempting to compile Firefox (Guix only has Icecat in its official repos, with which 99% of websites don't work because websites suck) for some stupid reason, then trying and failing to configure Nonguix substitutes, and then rebooting and actually succesfully downloading Firefox, I had a semi-working GNOME setup.

Except yeah, it was GNOME so 🤮.

Oh, and the charger was also defective, adding the perfect cherry on top. Although fortunately, it's a USB-C charger so I have plenty of those.

So what can I say? Maybe one day when Guix gets KDE Plasma properly packaged, I can achieve my dream of the perfect Guix + KDE Plasma + Wayland + all the other cool stuff laptop, but I don't even use any of the cool and powerful Guix features on my laptop (they'd be immensely useful on a server though). Maybe next time, maybe next time.

If you got so far, maybe you well expecting a nice laptop utopia at the end. But nope, life just gets in the way and we can't have nice things. Well, actually we can, if you just accept [boring tech](https://boringtechnology.club/) as good enough. Installing Arch + KDE Plasma + X11 + ext4 + PulseAudio right now and I don't regret it!!!
