---
title: "print(\"Hello, world!\") - Part 0"
date: 2020-09-01
draft: true
type: "post"
tags: ["Programming"]
---


*Originally posted on my [old blog](https://git.exozy.me/Ta180m/blog/src/branch/main/_posts/2020-09-01-print-hello-world-part-0.md)*


> *Your first podcast will be awful  
> Your first video will be awful  
> Your first article will be awful  
> Your first art will be awful  
> Your first photo will be awful  
> Your first game will be awful  
> But your first code will be perfect.  
> Zero bugs and very clean code.  
> It will be "Hello, world!"*
>
> *-- Anonymous*

For the past few years, "programming" and "C++" have been pratically synonymous for me. I knew about the wild world of other programming languages, but for the most part, I just stayed in my little C++ bubble. After all, for competitive programming, C++ is enough.

But C++ has its limits. For [modeling infections diseases](https://github.com/Ta180m/Infectious-Disease-Modeling), its lack of easy-to-use scientifc and numerical libraries complicated my project, and I ended up using Python. And AP Computer Science, which should really be called *AP Java Language and Composition*, forced me to learn Java. (Although I think College Board should switch to Python for that course) And trying out a new programming language couldn't be easier, with loads of online tutorials and compilers such as [OnlineGDB](https://www.onlinegdb.com/). And if I want to actually run a language on my Ubuntu computer and do benchmarks, I can just `sudo apt install` it.


## So what is this project?

This project is not meant to be an objective comparison of programming languages. Comparing programming languages with benchmarks is notoriously difficult, and there are already [great resources](https://benchmarksgame-team.pages.debian.net/benchmarksgame/) out there for that, so think of this project as more of a personal exploration of infinite universe of programming languages. (And don't take my "benchmarks" too seriously)


## So what are you going to do, anyways?

This is were the pseudocode below comes into play:

<script src="https://emgithub.com/embed.js?target=https%3A%2F%2Fgithub.com%2FTa180m%2Fprint-Hello-World-%2Fblob%2Fmaster%2Ftest.txt&style=hybrid&showBorder=on&showLineNumbers=on&showFileMeta=on"></script>

It contains everything to give a quick, high-level overview of a programming language: a recursive function definiton, an `if else` statement, an array or list, a `for` loop, and two nested loops through the array or list. The entire program has time complexity `O(N^2 log N)` of course, and with `N = 1000`, this runs at around a second in a typical programming language, allowing us to make some rough performance comparisons. (Although you really shouldn't take these measurements too seriously, as I said above)

I already have it implemented in about 10 different programming languages so far, so I'll try to post a new part about my experience with each language every day. I'm aiming for at least 20 language, but we'll see. It's all in the [GitHub](https://github.com/Ta180m/print-Hello-World-).

Anyways, check back ~~tomorrow~~ in two weeks for C++!
