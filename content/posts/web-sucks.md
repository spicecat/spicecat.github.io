---
layout: post
title:  "The Web Sucks!"
author: Ta180m
tags: ["Web", "Rant"]
---


[suckless.org](https://suckless.org) really hates [the web](https://suckless.org/sucks/web/). I'll quote them directly:

> *It has enabled the global information exchange, mass surveillance, studies in social control, allowed revolutions, made a fortune for many billionaires and in the meanwhile ruined our climate: the web.*

> *There is an industry which is specialized on extending the resource usage to display just some characters on your display. Millions of jobs are based on outputting HTML in an inefficient way. Look at PHP and all the techniques to extend its "scalability". It is not scalable, it's a prototyping language. Not to mention all its syntactic irregularities. Nowadays classes on classes on classes with getter and setter functions define buttons which can be stripped down to just a simple character string. The web is the practical example why corporate software development does not work and never will. It only ruins our environment, sanity and many brains which could be used for the better of humanity.*

> *PHP was used as the primary example for how interpreted languages produce resource waste. There were optimisations for compiling PHP to C++(!). But this is just a way to allow the mass of programmer sheep to go on and sleep calm at night.*


But why? How did web go from something to make all of humanity's knowledge available and connect people around the world turn into *this*?

To understand, we must first go back to 1995. You're probably thinking, that's when the Internet first started taking off, right? Nope, this is when Java was released.


## The origin

What does Java have to do with our current Internet mess? Everything. The date was 1995 May 3, a day that altered the course of programming history. The sad saga of the Internet begins here, with the release of Java.

What was Java all about? What new concept did it try to bring to the table? That's right, **Write Once, Run Anywhere (WORA)** (also known as [Write Once, Run Away](https://stgray.com/quotes/javaquotes.html)). Most programmers are lazy, and writing apps for every different OS variation is a boatload of work. I mean, look at Windows and Linux. They are completely different beasts, right down to the core. To begin with, they have different [line endings](https://www.hanselman.com/blog/carriage-returns-and-line-feeds-will-ultimately-bite-you-some-git-tips) which always seems to pop up in places where you expect it the least. Anyways, here comes Java, and suddenly, you can *write once*! Magic! Of course, early Java implementations didn't exactly deliver on performance, not until optimizations like JIT became a thing, but still! This was a revolution.

So, why did I just dump all of this information? Because here we see the crux that is the crap of the modern web. It all comes down to programmer laziness and convenience. And Java was the beginning. (Well, you can find examples of this much earlier, but I'm leaving them out of this post)

The web was also beginning its meteoric rise around 1995. The early web was originally meant only for [serving HTML](http://motherfuckingwebsite.com/), but then, some lazy programmer put 2 and 2 together and came up with Java web applets (hey also turned out to be hideous security holes). Now you could not only WORA, but *also* deliver your crummy little Java apps *over a browser*. No more installing stuff (except for Java). It was that easy!

And people took great advantage of it. Soon, all the major browsers, or at least the ones that wanted to be competitive, started shipping with support for Java applets. And that was the beginning of the idea that the humble *browser* could be the vector for this infection.

But no one uses Java applets anymore. In fact, they were officially discontinued in 2018 for being such cancerous security holes. While Java applets have not been able to survive the turbulence of time, a similarly named thing has.


## Java... Script!

Yep, that's right, JavaScript! The programming language that sucked so much on release that the creators named it after another popular language to build up false hype for it. The inefficient, bloated assembly language of the web. The language that has not only dominated the web but also has been ripped out of its already unfornate role and shamelessly promoted as the future of apps.

Let's tackle the first objection: does JavaScript suck? The short answer is, [absolutely](https://medium.com/javascript-non-grata/javascript-is-a-dysfunctional-programming-language-a1f4866e186f) [yes](https://hackernoon.com/the-javascript-phenomenon-is-a-mass-psychosis-57adebb09359)! There are tons of criticism circulating on the web, so I'm not going to delve too deeply on it.

On to the next concern: when you open a tab, what you are doing is effectively creating a new virtual machine. A freaky JavaScript/WebAssembly virtual machine, that is. For every tab! (Of course in the name of security!) Ever wonder why browsers are so notorious for consuming RAM? Well, this is it. That's what you get for running 10 VMs simultaneously!

What about lightweight browsers? I can think of a few of the top of my head: [Midori](https://astian.org/en/midori-browser/), [Falkon](https://www.falkon.org/), and [Links](http://links.twibright.com/). But throw some modern websites at them, and they'll crash and burn. That's right, the web has degraded so far into the JavaScript quagmire that the only way web browsers can actually be useful for 99.99% of people is to bloat them up so they turn out like Firefox.

Now that's pretty bad, but it only gets worse. Not only has JavaScript conquered the web, but it's also been encroaching and invading the space of desktop apps. Just look at [Electron](https://medium.com/@boundarybreaker/electron-is-a-hulking-monstrosity-of-a-wora-framework-and-it-needs-to-be-replaced-25e9d849b0e). GNOME has been integrating [JavaScript](https://gjs.guide/) everywhere into its desktop. Look at the proliferation of JavaScript frameworks, not limited to Node, Vue, Ember, Angular, React, Meteor, and more. This is an invasion!

So why is this happening? You don't have to look back any farther than Java's WORA mantra. At the end of the day, it's the toxic combination of vast OS differences and sheer programmer laziness. There is no way to escape the nightmare of supporting multiple operating systems. If you cheat and take the WORA route, you pay for it with your bloated, inefficient, unmaintainable apps. I haven't even started ranting about PHP but the message is the same.

So is there anything we can do about this? The short answer is not really. No programming language is perfect, but JavaScript is the polar opposite of perfect. Sure, there are better WORA languages and frameworks out there, but the underlying problems are here to stay. Programmers will always be lazy, and state of operating systems in 2021 is rather depressing and looks unlikely to improve anytime soon. If you ask me, the future looks very bloated indeed.

