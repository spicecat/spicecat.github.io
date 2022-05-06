---
title: "Fourth Time's the Charm"
date: 2022-05-03T08:36:10-05:00
draft: true
description: "The wrong way to teach Python to middle schoolers"
type: "post"
tags: ["programming", "python", "teaching", "school"]
---


```python
print (hello world)
```

I watch a middle schooler's typed Python code slowly appear character-by-character on my screen as I curse JupyterLab for never having working collaborative editing and wonder if we should have taught them Scratch instead.

OK fine, they're middle schoolers, halfway through a [basic NIH Python course](https://github.com/LadueCS/Intro-to-Python), doing coding practice only once a week for an hour. It's not like they're going to code the next super-intelligent AI at one of the meetings. But if I've learned something from teaching these kids Python, it's all just different possible wrong ways to teach Python.

Let's back up a little bit further? Why are we even teaching these kids Python in the first place? They're fidgety 6th, 7th, and 8th graders, wouldn't they have a whole lot more fun with Scratch? And that brings us to mistake number 1, AKA the mistake that started this whole mess. I know exactly why we're teaching Python and not Scratch. But ask one of the other people helping out and they'd likely shrug and have no clue what to say.

Yeah, so the "group leaders" teaching the kids (actually just glorified high school volunteers) aren't exactly the most well-educated either about any of this. [Teaching beginners is really freaking hard, but lucky for you, I've a list of tips!](https://github.com/LadueCS/Intro-to-Python#teaching) Yay!

Unfortunately, that didn't exist until last month, so you can probably guess that the group leaders were making these mistakes left and right.

Since we're on the topic of that Python course repo, it's the prefect time to bring up our textbook example of [NIH syndrome](https://en.wikipedia.org/wiki/Not_invented_here). The entire Intro to Python course was completely written from scratch (pun intended), and dozens of probably wasted hours later, we have a great beginner-friendly inside-joke-laden Python course! Honestly, the only advantage we got out of writing our own course was squeezing the density of inside jokes to infinity, which most people don't even notice anyways, maybe because they're *inside jokes*?

Even worse, the course started out in its humble beginnings as a [dumpster fire of tiny Python files containing a few useless examples for each topic](https://github.com/LadueCS/Intro-to-Python/tree/6e3b24571f1dd00492c0c301280ad03df94732e2). Yeah, it was... well, terrible woud be an understatement, right? I don't think I could've learned Python from that initial version of the course, and I can pick up new programming languages like, well I'm not trying to fle here, but you get the idea. NIH syndrome kills people!

Another side effect was that each time we did a major overhaul and rewrote everything, we thought we had the greatest Python course since the beginning of time! Well, because our new verison was so much greater and more awesome than the last, we *knew* this version would finally be the rewrite where we achieved ultimate perfection and ~~peace and harmony in the galaxy~~, but nah, we're almost done with our *fourth* rewrite and yeah, our course is nowhere near perfect.

I mentioned earlier that we split the kids into groups and have a high schooler teach each group. Well, there's a reason why there are so many unsolved integer partition problems, and that's because splitting things into groups is the largest PITA in the entire universe. Every single week, there are kids that don't show up, and high schoolers that don't show up, and the groups have to be scrambled up like eggs to accomodate this. 
