---
layout: post
title:  "Worst First Build - The Quest for a GPU"
author: Ta180m
tags: ["Hardware"]
---


Last Wednesday, March 10th, was going to be *the day*. The day I finally could complete a functioning (but incomplete) build. My slightly overpriced RAM sticks (RAM prices were creeping upward sinisterly so I decided I probably shouldn't wait longer. Probably a bad move, too, but whatever.) were arriving, and it was going to be momentous. I was going to boot up an Arch USB drive, SSH in, and get the party going.

![A low-quality image of the build, sans RAM, courtesy of an terrible iPad camera](/blog/assets/build.jpg)

Yeah... that didn’t exactly happen.

The first ominous sign was that the motherboard shipped with an old BIOS. According to anonymous Redditers, that particular version could boot to the BIOS menu, but no further. It wasn’t old enough to be a major problem, since I could probably still do a BIOS update, but it was definitely the first thorn in a long line of problems.

So on the big day, the RAM sticks arrive a few hours before Amazon predicted; always a good sign. It was the final piece of the puzzle, and now my build could finally start functioning! Installing the RAM went smoothly too. But everything basically fell off a cliff from there.

The first glaring indicator of an impeding disaster was that when I pressed the power button, the lights and fans whirred as expected, and the motherboard went through its POST, but monitor stayed pitch black. No signal.

Aw man, I didn't have a GPU, so... no signal! I was going to have to do this blind. No problem, though, since I could SSH in, right?

Well... let's not get ahead of ourselves. I still need to boot up Arch, right?

So I plug in the USB drive, and try to boot up, but oops! I can't see anything! So I have no idea if I really booted up or not, but according to `nmap`, no new network devices popped up, so I'll take that as a no.

I retrace all my steps, and recognize that SSH isn't correctly set up on the default install images. So... I go through the long detour of creating my own [Archiso](https://wiki.archlinux.org/index.php/Archiso) with SSH ready to go, and 15 minutes and one `dd` later, my USB drive is ready!

I do the boot sequence again (actually, several times) but still it doesn't work. 

Oh wait! The old BIOS! It's probably unable to boot Arch because of the old BIOS! I need to update it! An fortunately enough, I don't have a display.

I hate manufacturers that create convoluted BIOSes — especially ones that are absolutely impossible to navigate blindly! It doesn't help that BIOS updates tend to shuffle around the settings. I tried watching a YouTube video of someone showing off the BIOS, but it was a lost cause. It was impossible to do without a display.

Alright, so I got to find a GPU... dddaaarrrnnn!!!

The thing about buying a GPU right now is that everything's in one of two states: sold out, or marked up at extraordinary prices. [Five-year-old GPUs are fetching nearly two times their original price](https://www.amazon.com/GeForce-192-bit-Compatible-DirectX-Graphics/dp/B08YCRY3V7/ref=sr_1_1?dchild=1&keywords=geforce+gtx+%221060%22&qid=1615860494&sr=8-1), and the [latest releases](https://www.techradar.com/news/current-nvidia-rtx-3000-gpu-prices-are-so-much-worse-than-we-thought)? Just forget it.

Why is this happening? Well, it happens to be the perfect storm:

1. **COVID-19**: Everyone's stuck inside, and what to do to pass the time? Game, of course! Everyone's building PCs, and the supply simply can't keep up, and prices are balooning into the stratosphere. But that's not it.

2. **Cryptomining**: With Bitcoin and Ethereum smashing price records, cryptomining is back in full swing now. With one of the latest GPUs, you could be making *$5 a day!*. Mine for two months, and that'll be $300. You'll be willing to pay much higher for GPUs, pushing prices into the mesosphere. Yeah, Nvidia's messing with the BIOS of their latest RTX 3060, but will it help? [Not much](https://www.theverge.com/platform/amp/2021/3/16/22333544/nvidia-rtx-3060-ethereum-mining-rate-limit-unlock-driver).

3. **Component shortages**: The demand right now is overwhelming, but what about supply? It doesn't look very rosy either. In fact, quite the opposite. Manufacturers are trying to churn out electronic devices as fast as they can, and GPU components like DDR memory is in very short supply. Prices are skyrocketing into the thermosphere now.

4. **Tariffs**: Yep, even Trump has something to do with this. His last round of tariffs, this time including graphics cards, are the perfect cherry on top. Now prices are way up in the exosphere. Just great!

Of course, [there are other reasons as well](https://naturecheck.org/2021/03/15/cpu-and-gpu-availability-and-pricing-update-march-2021/), such as companies focusing more on CPUs and other more profitable parts, but GPU prices just seem to keep on going up.

With prices this high, who's actually buying the GPUs now? There has to be at least someone buying them.

Well, it's probably people who are extremely price inelastic or people who know absolutely nothing about normal GPU prices. Or just extremely wealthy people.

Even at the local [Micro Center](ategory/4294966937/video-cards), all they have now is some extremely overpriced Quadros and a few GTX 710s that are even slower than my laptop's current GPU. Doesn't look to good to be buying GPUs now. I *could* buy one since they aren't as overpriced as the ones on eBay, but that's a huge hassle I don't want to go through if I don't have to.

One last thing: Radeon 6700 XT launch on Thursday. It's way out of my price range, but perhaps it could be the beginning of better stock availability? Who knows. A Bitcoin or Ethereum crash could do the trick, too.

So that kind of rules out the option of buying a GPU right now.

But... I only need it for one or two hours, to update and set up the BIOS. What about borrowing a GPU?

Although promising, this only led to a dead end. My laptop's (discrete) GPU doesn't have an output port since it's part of a hybrid graphics system, so that won't do (among other possible problems, of course). The old Dell Dimension 4100 rotting in the basement has an ATI Rage 128 from 1999, with a *stunning* 32 MB of RAM clocked at 250 MHz, but it has the wrong connecter, AGP, instead of the current PCI-e. My friend has a desktop, but with... integrated graphics. I asked a few other people, but none of them had GPUs they could loan me.

It looks like my only options now are: asking more people to borrow their GPU, buy an extremely overpriced GPU and possibly sell it, or just wait. That last one doesn't look to fun, but it might just be the best option here.

It's quite frustrating that the only obstacle in the way of finishing my build is a GPU for an hour. I guess I now have a $666 mega paperweight sitting in my living room. Perfect!

![Another low-quality image of the build](/blog/assets/build2.jpg)
