---
title: "Taking Back the Web"
date: 2021-07-24T16:51:06-05:00
draft: true
type: "post"
---


*Originally posted on the [exozyme blog](https://git.exozy.me/exozyme/blog/src/branch/main/taking-back-the-web/index.html)*


<!DOCTYPE html>
<html>
    <head>
        <title>Taking Back the Web</title>
        <link href="/style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div>
            <br>
            <h2>Taking Back the Web</h2>
            2021 June 25
            <br>
            <a href="/blog">The exozyme blog</a>
            <br>
            <br>
            
            <h3>The web sucks</h3>
            
            <p>
                <i>Please note that this post may not reflect my beliefs anymore. See <a href="https://rosenzweig.io/blog/the-federation-fallacy.html">this article</a> for a fascinating read about the same topic. My writing sucks nearly as much as the web, by the way.</i>
            </p>
            <br>
            <p>
                First, the mandatory <a href="https://suckless.org/sucks/web/">suckless.org</a> quote:
            </p>
            <br>
            <p>
                <i>"It has enabled the global information exchange, mass surveillance, studies in social control, allowed revolutions, made a fortune for many billionaires and in the meanwhile ruined our climate: the web."</i>
            </p>
            <br>
            <p>
                The web sucks.
            </p>
            <br>
            <p>
                It really does. Just think about it.
            </p>
            <br>
            <p>
                 Think about what a day in the life of an average web user looks like. You wake up, check your Gmail, or more accurately, Google checks your Gmail and reads all your emails. Then you hop on to one of the degenerate, proprietary, bloated, <a href="https://en.wikipedia.org/w/Walled_garden_(technology)">walled garden</a> social media or chat sites like <a href="https://exozy.me/blog/dont-use-discord">Discord</a>, and mindlessly give away all your data to be sold away. And don't forget the whole time, you are wasting hundreds of megabytes of bandwidth to load crappy JavaScript libraries whose sole purpose is to display pixels on a display in a way that will generate the most profit.
            </p>
            <br>
            <p>
                The half-life of the average website is <a href="https://en.wikipedia.org/wiki/Link_rot">only two years</a>. The average website now over 2MB and getting bigger. That's over 60 times the size of the original Super Mario Bros. game. JavaScript is now used to write desktop apps which is complete insanity if you think about it. And if none of these shocked you, <a href="https://medium.com/s/silicon-satire/i-peeked-into-my-node-modules-directory-and-you-wont-believe-what-happened-next-b89f63d21558">this will</a>. Why do I need to have 10 different chat and social media apps on my phone? Why do some phones have <i>16 gigabytes</i> of RAM, twice as much as my trusty laptop, if not for web browsers? And don't get me started on the <a href="https://www.gnu.org/philosophy/javascript-trap.html">JavaScript trap</a>. Proprietary software, walled-garden platforms, and bloat all go hand in hand. On the bright side, it seems like the web has accomplished the goal of creating a universal operating system—a bloated, slow, resource-hogging JavaScript WebAssembly mess of an operating system inside an operating system that would make Emacs envious.
            </p>
            
            <h3>The project</h3>
            
            <p>
                Imagine a world where web pages load almost instantly. Imagine one where websites run on libre, free, and open-source software. Imagine life without the walled gardens that we all know and <del>love</del>. Imagine living without Google. Without Microsoft. Without Discord. Without YouTube. Without GitHub.
            </p>
            <br>
            <p>
                Impossible.
            </p>
            <br>
            <p>
                Or is it?
            </p>
            <br>
            <p>
                This world already exists. As for bloat, just look at the <a href="https://512kb.club/">512KB Club</a>. And for all of those services, there are worthy, decentralized, libre, privacy-respecting alternatives available for each and every one of those services. The question is, how can we build this future?
            </p>
            <br>
            <p>
                That's what the exozyme project is. Just look at our mission: building a libre, high-performance, privacy-respecting cloud. How can we make websites that are faster and more lightweight? How can we promote libre and open source software for web development? Is it feasible for ordinary people to use these privacy-respecting alternatives to walled gardens? What are the barriers of entry? How can we tackle the suffocating <a href="https://en.wikipedia.org/wiki/Network_effect">network effect</a>?
            </p>
            <br>
            <p>
                It's hard to say when the exozyme project really started. My interests in building a home server to supplement my aging laptop first began to turn into actual plans during November 2020. As the months went by, it slowly morphed into a more privacy and self-hosting focused project. I experimented with hosting simple servers on my laptop in the meantime and discovered <a href="https://cloud.exozy.me/">Nextcloud</a>, firmly cementing the project's direction towards self-hosting. As for lightweight websites, I was inspired from witnessing <a href="https://en.wikipedia.org/wiki/Wirth%27s_law">Wirth's law</a> in action on my six-year-old laptop. Come on, why do web browsers need so much RAM? Finally, on March 25 at 22:15:31, the project reached a milestone. According to server logs, exozyme was now live!
            </p>
            <br>
            <p>
                Let's take a close look at open, privacy-respecting services with Nextcloud, one of the first things I set up on exozyme. I have a lot of good things to say about Nextcloud. Here's a quote from my personal blog:
            </p>
            <br>
            <p>
                <i>"Nextcloud is basically a huge hammer that tries to attack every nail. For most cases, a more specialized tool would be better, but Nextcloud can still give you a surprisingly functional solution to… file sharing, real-time collaborative document editing, photo management, chat, email client, contacts, calendar, music streaming, notes, tasks, forms, maps, Matrix client, and RSS client. So yeah, Nextcloud knocks down quite a few bowling pins with one gigantically overpowered bowling, or perhaps more accurately, wrecking ball. I anticipated a painful setup process for such a large monolith, but it went surprisingly smoothly. Perfect!"</i>
            </p>
            <br>
            <p>
                So that knocks out Google Drive, Google Calendar, Google Photos, Google Tasks, Google Forms, and more. Some people would call it bloated, but Nextcloud is awesome! Even better, it's <a href="https://en.wikipedia.org/wiki/Federation_(information_technology)">federated</a>.
            </p>
            <br>
            <p>
                 Federation is going to be a word you're going to be hearing a lot, so let's examine it closely. The whole idea behind federation is that we want to combine the strengths of the client-server model with the decentralization of the peer-to-peer model. While we all know and love P2P networks such as the <a href="https://blogs.cornell.edu/info4220/2013/03/15/how-bittorrent-addresses-the-free-riding-problem/">fascinating BitTorrent protocol</a>, they aren't the best choice for many applications. Often times, we need a bit of centralization. Federation tries to address this by having small servers that communicate in a larger P2P network, maintaining some amount of decentralization. In the end, federation is really just a hybrid of client-server with P2P.
            </p>
            <br>
            <p>
                So now that we have our powerful weapon of federation, we can start replacing most hated services with federated alternatives. Instead of Discord, try <a href="https://chat.exozy.me/">Matrix</a>, a decentralized protocol with strong encryption—it's basically email but for chat. It doesn't quite have a huge userbase yet, but it's much less degenerate than the idiocracy that is Discord, and it has some innovative ways of coping with the network effect that we'll see later. <a href="https://social.exozy.me/">Mastodon</a> is a vibrant federated alternative to Twitter with millions of users. <a href="https://tube.exozy.me/">PeerTube</a> is a new federated replacement for YouTube, although my server is currently flooded with Blender propoganda for some reason. Not that I dislike Blender—the complete opposite, actually—but it gets annoying after a while. There's also <a href="https://git.exozy.me/">Gitea</a>, a GitHub alternative that's not federated yet, but coming soon. Anyways, these alternatives do exist, and they work very well, too.
            </p>
            <br>
            <p>
                Why aren't we all using Nextcloud and Matrix and Mastodon and PeerTube and Gitea? Anyone with common sense can tell you: unfamiliarity, switching costs, the fact that everyone else uses the proprietary services instead... The list goes on and on.
            </p>
            <br>
            <p>
                 Now what about the bloat of modern websites? What can we do about that? It's way to easy to blame it all on JavaScript, both bloated client-side JavaScript and server-side Javascript (which is an abomination), but the real reason is that people don't care enough about creating fast and lightweight websites (or any other kind of software). Hardware will get faster over time anyways, right?
            </p>
            <br>
            <p>
                I'll quote suckless.org again for this:
            </p>
            <br>
            <p>
                <i>"There is an industry which is specialized on extending the resource usage to display just some characters on your display. Millions of jobs are based on outputting HTML in an inefficient way. Look at PHP and all the techniques to extend its "scalability". It is not scalable, it's a prototyping language. Not to mention all its syntactic irregularities. Nowadays classes on classes on classes with getter and setter functions define buttons which can be stripped down to just a simple character string. The web is the practical example why corporate software development does not work and never will. It only ruins our environment, sanity and many brains which could be used for the better of humanity."</i>
            </p>
            <br>
            <p>
                <i>"PHP was used as the primary example for how interpreted languages produce resource waste. There were optimisations for compiling PHP to C++(!). But this is just a way to allow the mass of programmer sheep to go on and sleep calm at night."</i>
            </p>
            
            <h3>The future</h3>
            
            <p>
                So what now? These problems are beyond hard. They're nearly impossible to solve. 
            </p>
            <br>
            <p>
                But only nearly. There are solutions. Look at what Matrix is doing with <a href="https://matrix.org/bridges/">bridges</a>. I need to have a Discord account in order to communicate with everyone else who uses it—the network effect strikes again! But with bridges, I can link my Matrix and Discord accounts together, in the process violating Discord's Terms of Service, but screw Discord. The important thing is that I'm no longer imprisoned by the network effect on Discord. Freedom!
            </p>
            <br>
            <p>
                Or look at what <a href="https://activitypub.rocks/">ActivityPub</a> is doing. Follow your favorite PeerTube channels using Mastodon, or communicate with users from other ActivityPub platforms like Pleroma, or explore the entire <a href="https://en.wikipedia.org/wiki/Fediverse">Fedirverse!</a> Privacy-respecting, decentralized services have advantages that no proprietary service can beat.
            </p>
            <br>
            <p>
                What about website bloat? Well, tt really is possible to write websites that don't need hundreds of JavaScript libraries—just look at the one you're reading right now! A general rule of thumb is to avoid JavaScript when possible. You can accomplish a lot with just HTML and CSS alone.
            </p>
            <br>
            <p>
                It's the same thing with libre, open source software. A common counterargument is that hey, I'm not a developer so open source doesn't matter. That couldn't be more wrong. Even if you are not a developer yourself, other people who are developers will contribute and improve your favorite open source projects, benefitting everyone.
            </p>
            <br>
            <p>
                So what does the future look like? For a pessimist, not too bright. There's just too much that we need to improve. This is not going to be a fight that is easily won. But I hope the exozyme project can provide you with a bit of hope that we can do this. We can take back the web.
            </p>
        </div>
    </body>
</html>
