---
title: "Gitea Federation... Coming Soon to an Instance Near You!"
date: 2022-04-05T20:48:00-05:00
description: "A progress update for the ongoing ActivityPub federation implementation for Gitea"
type: "post"
tags: ["gitea", "federation", "activitypub", "decentralization", "git"]
---


Alright, so you've probably been waiting for years for Gitea federation and are just burning to find out when it'll be released. After all, it's been four years since work started on ForgeFed, and federation has proven to be far from trivial. So what's been done so far and what still needs to be worked on?

If you've been following the Gitea federation story recently, you've probably heard about the [NLnet Gitea frant](gitea-is-the-future). The [milestones](https://discourse.gitea.io/t/milestones-for-federation-grant/4895) for that were recently published, and it looks pretty doable! Even better, the first two milestones are almost finished, and the third is being worked on at the moment. The others all seem straightforward too, right?

Yeah, if it was really that easy, people would have finished it all three years ago. [This plan](https://github.com/go-gitea/gitea/issues/14186) is more like what we're dealing with here. It's... a lot.

ActivityPub is a nice protocol with an especially nice [specification](https://www.w3.org/TR/activitypub/) (read it, it's really really nice!), but it's also completely different than what Gitea currently supports. There's actors and inboxes and outboxes and sending and receiving activities and ActivityStreams and all of that needs to implemented down to every technical detail.

Fortunately, we have a library to the rescue, [go-fed](https://go-fed.org/)! Unfortunately, go-fed is huge (as in, 20 MB) and complex, and you need a solid understanding of ActivityPub to use it at all.

So there we have the problem. There's a mountain of work that needs to be done, and you need both an extensive knowledge of ActivityPub and an extensive knowledge of the Gitea codebase to do anything.

Or do you? Personally, I just started learning ActivityPub a month ago, and it's starting to click. However, the Gitea codebase is still a disorienting maze for me to navigate. Luckily there are several Gitea maintainers interested in working on federation who can help with highly Gitea-specific components like the UI or implementing the go-fed [pub.Database](https://go-fed.org/ref/activity/pub#The-Database-Interface) interface.

So as you might have predicted, this is going to be quite the team effort. We're really fortunate to have Loïc Dachary from [Forgefriends](https://forgefriends.org/) also helping with the Gitea federation implementation and I don't think any of this would have been possible without him.

OK, so what's the current progress on Gitea federation? The [federation tag](https://github.com/go-gitea/gitea/labels/theme%2Ffederation) on the Gitea issue tracker is still pretty lonely, but there's [one important PR](https://github.com/go-gitea/gitea/pull/19133) currently in review (disclaimer: I submitted the PR). I'm also working on ActivityPub inboxes and outboxes: hopefully we'll have federated following soon, but it currently doesn't work.

For me, it's been quite a new experience to work on implementing a big feature for a major open-source project. Yeah, I'd previously contributed to [KDE](https://invent.kde.org/frameworks/knewstuff/-/merge_requests/115) and some others, but it was always a small bug fix or some other miniscule change. I've also worked on big personal projects like [OpenContest](https://github.com/LadueCS/OpenContest) and [Intro to Python](https://github.com/LadueCS/Intro-to-Python) (this one is quite the doozy, teaching beginners Python is next to impossible), but those were with one or two other people.

This seems completely different. There's so much work to be done, but there's also so much energy and contributors and more and more momentum is building. If you're interested in helping out, check [this](https://github.com/go-gitea/gitea/issues/18240#issuecomment-1071103414) out. With the progress so far, I can definitely see ActivityPub federation released sometime in Q3. Stay tuned until then!
