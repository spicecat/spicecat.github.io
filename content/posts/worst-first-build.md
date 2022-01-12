---
title: "Worst First Build"
date: 2021-02-09
type: "post"
tags: ["Hardware"]
---


*Originally posted on my [old blog](https://git.exozy.me/Ta180m/blog/src/branch/main/_posts/2021-02-09-worst-first-build.md)*


My laptop's starting to get old. I mean, it works perfectly fine for the most part, but open up a few Google Docs at the same time and watch it struggle to load them: its age is starting to show. Or try to run Zoom (sandboxed in a browser, of course) and anything else at the simultaneously, and you'll get an ugly surprise when your Zoom audio starts crackling up really bad *and* the other app lags like crazy. Fun.

Well anyways, new laptop time?

Good question. A laptop with the specs I was looking at starts at over $1200 (Ryzen 5, 16GB RAM, 512GB SSD), and add the additional features of my current laptop—touchscreen, stylus, and a dedicated GPU—and you're looking at $1500 price tags. (Subtract $50 to remove the ["Windows Tax"](https://en.wikipedia.org/wiki/Bundling_of_Microsoft_Windows#The_%22Windows_tax%22), but still!) Can we do better?

Of course. Why are these laptops over $1500? Well, for starters, they are portable and come with lots of other nice things that I really don't need. I basically use my laptop like a desktop the vast majority of the time. Built-in keyboard? No thanks, I have plenty of keyboards. Screen? Nah, I use a monitor with my laptop anyways, so that screen is going to waste. So what's the obvious solution here?

Get a desktop! Easy. Now the hard part is actually getting one. Prebuilts are usually pretty bad. So I decided to build one.

OK. New life mission. Alright, how to start? The first step was asking a friend who has a much more vast amount of knowledge about this topic, basically, an "expert", so I did. And I got back a ton of useful links and information that can be boiled down to this: [logicalincrements.com](https://www.logicalincrements.com/) and [pcpartpicker.com](https://pcpartpicker.com/). Great! Now I have some stuff to work with! So I punched the "good" tier (Or was it "great"? Doesn't matter since I changed most of the parts anyways) into PCPP and hooray, I have a plan. Not a very good plan, since I still felt that I could get some better parts for the same price.

Next comes the period of heavy research. First, bump that 3600X up to a 5600X (good luck finding it though). Switch to an AMD card, since Nvidia drivers on Linux are `mpv "https://youtu.be/iYWzMvlj2RQ"`. Anyways, getting that out of the way, I made a few swaps here and there for a better case, motherboard, and a couple other parts, and hooray, I have another plan. This was around the beginning of December 2020.

Great, [I have a plan](https://pcpartpicker.com/user/unixkcd/saved/#view=cPjHGX). Now what?

Well, time to buy the actual parts. Fortunately, PCPP tracks the price history of parts, so it was pretty obvious to buy the SSD now and wait a bit for the other stuff. The 5600X was definitely going to be a headache, and I decided to wait for the new series 6000 AMD graphics cards to be announced. I also set up email alerts for all the parts on my plan.

OK, let's tackle the 5600X and get it over with. Step 1: join the Micro Center Discord ([Matrix](https://matrix.org/) > Discord), since I live close to a Micro Center and buying locally has the advantage of considerably less competition from bots at the expense of insane taxes. Oh well. Step 2: watch the Discord closely for "drops". Step 3: Go to Micro Center and hope that they haven't sold out since someone posted they had stock on the Discord.

It took about a month. Micro Center was pretty dry throughout December. But when January came, my fortunes changed significantly as it seemed that the local demand had shrunk dramatically. Perfect! When I finally snagged one in mid-January, there were still about 15 5600X's left, unclaimed for several hours. The stock problems online are definitely the result of bots. Of course, there would still be shortages during the paper launch, but bots significantly exacerbated the issue. Micro Center proves this. Micro Center has very strict no scalping rules, such as only allowing a person to buy a highly in-demand CPU or graphics card once a month. As a result, there's literally no demand for 5600X's now at a local level!

Alright, got that one out of the way. At this point, I have three parts: a SSD, a PSU that was on sale during Christmas, and a 5600X. Not enough to do anything just yet. And that's where I am today.

But... you got the 5600X a month ago! What did you do during that month?

Well, on average, [PC part prices](pcpartpicker.com/trends/) tend to be lowest in November and December. And for the past month, I've been seeing almost nothing other than price rises. The case increased by $30. The RAM increased by nearly $30 and set a new price record. The motherboard is up $35 from its lowest price, only a month and a half ago. Yeah. So if I buy them now, I'll be looking forward to blowing over my initial budget by nearly $100.

Ironically, if I had bought all the parts in December, I wouldn't be in this situation right now. Even more ironically, I might have been in another tight situation. The B550 motherboards were in need of BIOS updates when the series 5000 processors first came out in their paper launch, and the motherboard I had planned on buying needed an older CPU to update the BIOS. Not like I have an old CPU lying around to do that, unfortunately. So, I waited. To my detriment.

I really don't know why I didn't buy those parts in December. Those prices make the ones now look like some kind of major supply chain disruption happened or something. (COVID-19 continuing to unleash its wrath?) I don't even want to talk about GPUs. Last summer, people said to wait for the launch of the next-gen GPUs and prices of older ones would go down. Well, guess what happened? When the Nvidia series 3000 and AMD series 6000 launched in that epic paper launch, prices of older ones actually went *up*. WTF??

Yeah. Pretty bad. Even worse is the fact that if you had bought a Radeon 5600 XT a year ago, it would have cost about $280. Now? You can easily sell it for double, or even 2.5 times the original price, earning a $400 profit plus the additional utility you got out of using it for a year. Terrible.

So why is all of this happening? Well, the one thing that's been weirdly consistent is that many major retailers are selling these parts *at MSRP*. Why is this crazy? Because the demand is over the roof, with tons of COVID-19 gamers and others looking to build PCs. Jack up the prices a bit, at the major retailer level, and those retailers could be pulling in millions of extra profits. They only have a limited supply, so it's not like they're going to sell less.

So why don't they do that then? Maybe I don't understand basic economics or business thinking, but raising prices at a major retailer level instead of a corresponding price raise for resells on eBay would result in quite a lot of benefits. Imagine all the hours of productivity loss from pursuing stock drop notifications to fight over some parts where the buyers outnumber the supply by a factor of one hundred to one, or the mounds of money flowing into the pockets of scalpers from marking up prices by a factor of two and reselling on eBay. Why is the 5600X *only* $300 when it's going on eBay for over $400, for instance? This is a particularly benign example compared to graphics cards which sell for over twice the MSRP on eBay. And why don't online retailers have better anti-bot mechanisms in place, such as CAPTCHAs that computers actually *can't* solve?

Well, enough ranting. Hopefully when I write part 2, there'll be some price drops. For now, doesn't look like it.

