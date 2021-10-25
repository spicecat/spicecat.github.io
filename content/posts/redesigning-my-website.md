---
title: "Redesigning My Website"
date: 2021-10-24T19:25:13-05:00
description: "I finally finished redesigning my website using Hugo"
type: "post"
tags: ["website"]
---


My [old website](https://web.archive.org/web/20210813044159/https://ta180m.github.io/) [sucked](/posts/web-sucks). Like, for real. It was a bit of hard-written HTML plus a Jekyll blog, and it was a huge pain to update and maintain. GitHub kept randomly emailing me about various security vulnerabilities in some Ruby dependency of Jekyll, and hard-written HTML can only get you so far before you rage-quit.

So what now? Well, I did write a different site using the Hugo static site generator, [howtuwu](https://exozy.me/howtuwu/), and it turned out really nice. Hugo written in Go (of course) and compiled to a single binary, so no more worrying about Ruby dependencies! And writing in Markdown is a whole different level than HTML and actually kind of fun. No one ever said writing HTML is fun. So, why not rewrite my personal website in Hugo too?

I started by searching for a [Hugo theme](https://themes.gohugo.io/). Almost by accident, I discovered the [Gokarna theme](https://themes.gohugo.io/themes/gokarna/), and I have to say, I absolutely love it. It has everything that I need: icons for my various accounts, tags that actually work, an RSS feed, and dark mode. With my [personal Gokarna fork](https://github.com/Ta180m/gokarna), it's perfect. I even managed to sneak in this from my old blog:

> 404 ... You've reached an imaginary page!  
> Please [rotate your computer 90 degrees](https://old.reddit.com/r/learnmath/comments/s4rt0/why_does_multiplying_by_i_correspond_to_90_degree/) and try again.

Currently, the new site is deployed to GitHub pages using a [GitHub Action](https://gohugo.io/hosting-and-deployment/hosting-on-github/), while a development version (bleeding-edge not-yet-pushed Git commits!) is hosted on [exozyme](https://ta180m.exozy.me).

This morning, I finally finished moving my old blog posts over to this new site. The difference between hard-written HTML and Jekyll is pretty big, but in my opinion, the difference between Jekyll and Hugo is even bigger. I finally have a slick website that's aesthetic, lightweight, and easy to maintain!
