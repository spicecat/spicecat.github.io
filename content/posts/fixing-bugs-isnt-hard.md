---
layout: post
title:  "Fixing Bugs Isn't Hard!"
author: Ta180m
tags: ["Linux", "KDE"]
---


A few days ago, I wanted to record my screen, and in process, I discovered [this bug](https://bugs.kde.org/show_bug.cgi?id=417575). It doesn't seem like a very complicated bug, right? Just look through the code, find out what's wrong, and send in a pull request! Or is it that easy?

![The bug](/blog/assets/spectacle.png)

The first issue is that [Spectacle's code](https://github.com/KDE/spectacle) is not exactly the most readable code out there, but I was able to identify [line 209 in `GUI/KSMainWindow.cpp`] as the critical line. So what is `mScreenrecorderToolsMenuFactory` and what does `fillMenuFromGroupingNames` do?

They are actually functions in [KNewStuff](https://github.com/KDE/knewstuff), which I saw was referenced on the bug report. So, I `git` cloned the repository and started to get my hands wet.

The first thing to do was to read through the code, except like Spectacle, it wasn't easy. To make things worse, the function calls snaked through various files, going from `kmoretools/kmoretoolsmenufactory.cpp` to `kmoretools/kmoretoolspresets.cpp` to ``kmoretools/kmoretools.cpp`. But as I went deeper, it got more and more confusing.

Time to pull out the power tools! `gdb` time! Arch doesn't have KDE debug symbols in any repository, so I compiled Spectacle and KNewStuff myself and installed them. Now I'm just a `gdb` away from finding the bug!

Or not. Turns out that when `gdb` hits a breakpoint, the entire X server freezes. Yeah, that's no too good. I first tried debugging it in a TTY but later realized it would be much easier to spin up a Xephyr nested server and run it on there.

That aside, it was now time to find the bug! I added breakpoints strategically such as on the critical line 209 in `GUI/KSMainWindow.cpp`. After following the code down several levels, I finally reached...

[KService](https://github.com/KDE/knewstuff/blob/a90a326fb570315e13dc3f24e80e8a032b960647/src/kmoretools/kmoretools.cpp#L122). What the heck is [KService](https://github.com/KDE/kservice/)? Do I really have to clone and compile yet another repository?

The last piece of the puzzle was actually printing out the QStrings, since QT apps just *have* to use their own string class instead of the one in the standard library. Fortunately, KDE has some nice [GDB scripts](https://raw.githubusercontent.com/KDE/kde-dev-scripts/master/kde-devel-gdb) to dump in the `.gdbinit`, and after doing that, I could print QStrings without a problem.

Finally, after digging through more code, I reached the bottom of this!

```
Thread 1 "spectacle" hit Breakpoint 2, KServiceFactory::findServiceByDesktopName (
    this=0x555555ca04b0, _name=...)
    at /home/ta180m/git/kservice/src/services/kservicefactory.cpp:91
91          if (!m_nameDict) {
(gdb) printq5string _name
com.obsproject.Studio
(gdb) n
[Thread 0x7fffaf7fe640 (LWP 133529) exited]
[Thread 0x7fffae7fc640 (LWP 133531) exited]
[Thread 0x7fffaeffd640 (LWP 133530) exited]
[Thread 0x7fffadffb640 (LWP 133532) exited]
98          int offset = m_nameDict->find_string(_name);
(gdb) n
99          if (!offset) {
(gdb) p offset
$1 = 385190
(gdb) n
103         KService::Ptr newService(createEntry(offset));
(gdb) n
106         if (newService && (newService->desktopEntryName() != _name)) {
(gdb) p newService->desktopEntryName()
$2 = {d = 0x555555d232c0}
(gdb) printq5string newService->desktopEntryName()
com.obsproject.studio
```

Note that the top `com.obsproject.Studio` has different capitalization than `com.obsproject.studio`! This, as it so happens, is the true cause of the bug. `vokoscreenNG` also has two capital letters, which probably cause the same thing to happen. Perfect, we've found the bug!

Great, so how do we fix it now? None of the KDE codebases are properly designed to be able to handle uppercase names like these, so this is bound to cause more problems in the future. One easy fix could be to convert the names to lowercase before calling the KService functions, but who knows how many bugs are currently plaguing KService because of this? I don't really want to meddle with KService so I think I'll create a pull request for KNewStuff.

![Fixed!](/blog/assets/spectacle-patched.png)

Time to send in a [pull request](https://invent.kde.org/frameworks/knewstuff/-/merge_requests/115) (or merge request as they call it on GitLab)! The actual patch is tiny: just add a `.toLower()` on line 122 of `kmoretools/kmoretools.cpp`. So little for so much hard work!

Well, it's great that this small bug has finally been solved. Debugging isn't hard! You just need to be persistent, and you'll get to the root cause of the bug eventually. Well, maybe I got lucky here, but it's not hard to be a bug fixer! I'm just waiting for the patch to get merged. Until next time!

