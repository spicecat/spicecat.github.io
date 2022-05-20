---
title: "So You Want to be Anonymous Online?"
date: 2021-04-23
draft: true
type: "post"
tags: ["Web"]
---


*Originally posted on my [old blog](https://git.exozy.me/Ta180m/blog/src/branch/main/_posts/2021-04-23-so-you-want-to-be-anonymous-online.md)*


Let's get started! The first thing to understand is that this goal is **impossible**.

> "A strange game; the only winning move is not to play."

Impossible. Unless, of course, you put all your electronics in a safe and never use them again. If you're up against a sufficiently determined adversary (like the government for instance), this is simply not possible.

But this isn't the goal of most people, or even the vast majority of people. Very few are actively seeking to prevent the government from spying on them, since it's practically impossible without making huge sacrifices. But for most people, you're mainly going to be trying to stop companies, such as the big tech monopolies like Google and Microsoft, from tracking you.

This requires us to define our **threat model**. What threat are we trying to stop from tracking us? Is it corporations, online trolls, law enforcement, the government, or something else?

Also, remember that **privacy and anonymity are closely related but different concepts**. Privacy is all about keeping your personal data private. It's about controling your personal data. But anonymity takes things a whole step further: not only are you in control, but you additionally hide your identity from third parties that you can't control. As you might expect, it takes significantly more work to achieve this!

The rest of this post is going to go through some possible actions you can take, ranging from mundane to extreme. Beware that the going down the extreme route is quite a big rabbit hole. Let's begin!


## So you care a little bit about privacy?

Here's a few easy things the everyday person can do.

### Use an ad-blocker

This one's easy! I highly recommend [uBlock Origin](https://ublockorigin.com/). Just install it, and it'll start blocking ads and trackers!

### Fiddle with your browser's privacy settings

Browsers like Firefox have settings like "strict tracking blocking" that you can enable. They aren't great, but it's a start. You should also turn off ad personalization in your Google settings.

### Use a password manager

Don't reuse passwords. If you're looking for a quick and easy solution, try a password manager!

### Use two-factor authentication

This is another easy thing to do. You're probably already doing it!

### Use incognito mode

Yeah, this doesn't really work. But at least you'll feel better.


## So you want to stop corporations?

Now it's going to start getting more and more extreme. Buckle in for the ride!

### Change your browser

The dominant browser, Google Chrome, is a privacy nightmare, as you might expect. The next alternatives, Firefox, Edge, and Safari, are not your friends either. The Brave browser is super sketchy so I wouldn't recommend it either. If you're serious, get [LibreWolf](https://librewolf-community.gitlab.io/). It's Firefox but with much better privacy settings.

### Change your search engine

Another sacrifice. Google search has a monopoly, and it's terrible for privacy. [DuckDuckGo](https://duckduckgo.com/) is somewhat better but not perfect. [StartPage](https://startpage.com/) is OK too. There's also [Searx](https://searx.me/). At this stage, any one of those three should be good. However, if you're feeling hardcore, they wouldn't be enough...

### Use a VPN

VPNs are not magic. They will not allow you to become anonymous. But they are an important step towards masking your IP address, so it's definitely something to look into.


## So you're really hardcore?

These steps are quite hardcore, and I wouldn't recommend them to almost anyone except for the most hardcore folks out there.

### Block nearly everything

uBlock Origin, mentioned above, can be configured to be a powerful anything blocker. With [hard mode](https://github.com/gorhill/uBlock/wiki/Blocking-mode:-hard-mode), you'll have significant protection against tracking, although at the expense of most sites being broken. [NoScript](https://noscript.net/) is another good extension to block JavaScript, but it breaks almost all websites.

### Don't use X

Pick any common website, and there's a large chance it'll be something you shouldn't use if you're at this stage. Basically any Google service. You should delete all your social media accounts, including Facebook, Twitter, Snapchat, Reddit, and Discord. Only use open source software when possible.

### Self host stuff

Whenever you use an online service, you're using someone else's hardware. And the vast majority of the time, they are going to be able to exert some power and control over you, and possibly use it as a way to spy on you. The solution? Run these services on your own hardware! Need a search engine? You can self-host Searx if you have a spare server lying around. Need GSuite? You can self-host Nextcloud, a great productivity suite alternative.

### Use Tor

[Tor](https://www.torproject.org/) has a bad reputation. It's notorious for being a tool that criminals use to remain anonymous. However, it's still far from perfect.

So what exactly is Tor? To understand, you have to know what onion routing is. Basically, it's like a convoluted relay race. You want to visit a website? First, your data is encrypted and hops to one of the several thousand Tor nodes around the world, and then it's encrypted again and hops from that node to another random one, and over again several times. When your data finally exits the Tor network, it's been spun around so much inside the network that it's incredibly hard to track. By successively nesting the encryption each hop, it's like adding layers to an onion, hence the name. Pretty cool!

It's not perfect, but works decently when paired with a good VPN.

### Use Tails or Whonix

These are simply Linux operating systems that have very good privacy settings, such as using Tor for all internet connections.

### Encryption

Encryption is your friend! If you use it wisely, it's a key step on the road to anonymity.

### Be careful with fingerprinting!

You can use [this site](https://amiunique.org/) to check if your browser's fingerprint is unique. It's one way Tor and VPN users can be tracked, so be careful!

### Use your phone as little as possible

Unless you have dumb phone, in which case you should be fine.

### Qubes!

[Qubes OS](https://www.qubes-os.org/) is straightup crazy. If you thought Tails was extreme, this will blow your mind. The key idea is to basically run everything in isolated virtual machines. By doing so, you can achieve an impressive amount of security and privacy.


## So you want to stop the government?

Pretty much no one should be doing any of these things, since they are very extreme, to say the least. Anyways, here we go!

### Have a normal online life

You're going to look awfully suspicious if you're doing these things (especially some of the things below). Having an alternative normal online life could be a good idea.

### Tor over VPN over Tor over VPN over Tor

The basic idea is to nest these services several times, further confusing anyone trying to track you. This should be reasonably effective, although it's probably not enough against governments.

### Get a new computer every time you want to visit a web site and destroy it aferwards

Not very environmentally friendly, but it works!

### Lock all your electronics in a safe and never go online again

This is it. The ultimate solution.


## Further reading

- [A basic privacy guide](https://onlineprivacy101.info/)

- [A 186 page guide that won't even stop the government](https://anonymousplanet.org/guide.pdf)

- [Some other good ideas](https://gist.github.com/bluehat/354432b82650d0a722ed)

