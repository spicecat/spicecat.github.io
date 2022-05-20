---
title: "Best CLI Tools"
date: 2020-12-24
type: "post"
tags: ["Random", "Linux"]
---


*Originally posted on my [old blog](https://git.exozy.me/Ta180m/blog/src/branch/main/_posts/2020-12-24-best-cli-tools.md)*


# `tldr`

The. Best. Documentation. Tool. Ever. Seriously. Instead of pulling up a web browser, searching for the command, and scrolling through pages of documentation, you can instead use `tldr` to get most common use cases for a command. Sure, maybe 10% your particular use or flag won't be on there, but it's a great quick-and-dirty way to get a refresher about unfamiliar commands.

![`tldr 7z`](/img/tldr-7z.png)


# `fzf`

Like `find` but better and more powerful. For instance, `pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'` will start up cool two-panel search for your (Arch) system's packages. And that's just the tip of the iceberg; there's so much more you can do with `fzf`

![`pacman -Qq | fzf --preview 'pacman -Qil {}' --layout=reverse --bind 'enter:execute(pacman -Qil {} | less)'`](/img/tldr-fzf.png)


# `convert`

No need to upload your images to sketchy websites who could steal your data in order to do image conversions. Imagemagick's `convert` tool has got your back. It's just `convert image.jpg image.png`, or you can also throw in some flags to resize the images and do other kinds of manipulation. It's magic! Or should I say "magick"?

![`convert`](/img/tldr-convert.png)


# `last`

Ever wanted to know your system's installation date, or even better, the full history of shutdowns and reboots? Well, `last` can help. Typically found in the `util-linux` package, it will faithfully log every boot and shutdown. According to `last` my system was "born" on Thursday September, 3rd 22:18:55 2020. Great to know, so I can celebrate its cake day next year!

![`last`](/img/tldr-last.png)

