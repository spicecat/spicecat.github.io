---
title: "The Next Step"
date: 2021-07-26T21:08:55-05:00
draft: true
type: "post"
---


*Originally posted on the [exozyme blog](https://git.exozy.me/exozyme/blog/src/branch/main/next-step/index.html)*


<!DOCTYPE html>
<html>
    <head>
        <title>The Next Step</title>
        <link href="/style.css" rel="stylesheet" type="text/css" />
    </head>
    <body>
        <div>
            <br>
            <h2>The Next Step</h2>
            2021 July 26
            <br>
            <a href="/blog">The exozyme blog</a>
            <br>
            <br>
            
            <h3>From one to eight</h3>
            <p>
                Over the past month, something big has happened with exozyme. Really big.
            </p>
            <br>
            <p>
                We're no longer just a small person project used by me exclusively. We've gone from one user, me of course, to eight already, in the span of a month. It's been quite a wild ride!
            </p>
            <br>
            
            <h3>An ArchWiki betrayal</h3>
            <p>
                Alright, so one of exozyme's core services is remote desktop. Easy enough, right? VNC seems to be the dominant solution, but by some fortunate stroke of luck, SDDM happens to be the only display manager that doesn't support the XDMCP protocol for multi-user sessions. (That was a lot of accronyms in one sentence) Darn it. Time to use a different display manager maybe? Or, maybe start a VNC session for each user?
            </p>
            <br>
            <p>
                Both solutions have their flaws. XDMCP is pretty dated protocol, and running a VNC session each for potentially dozens of users is a huge waste of RAM when only a few might be accessing their remote desktop at the same time. What now then? There's an assorted jumble of more accronyms for other remote desktop protocols, like RDP and X2Go, or even plain X forwarding over SSH, just to name a few. X2Go is quite convoluted to set up on Windows and Macs so that's out of the picture. Same with X forwarding. Looks like RDP is the answer then!
            </p>
            <br>
            <p>
                As always, when setting up a new piece of software, we'll consult the godly ArchWiki. In this case, it's xrdp, the RDP server. Except...
            </p>
            <br>
            <p>
                I'll never seen a worse ArchWiki page. <a href="https://wiki.archlinux.org/index.php?title=Xrdp&oldid=681814">Here's what it looked like</a> when I first read it. It's terrible. There's no logical organization, and I barely get what half of it is even trying to do.
            </p>
            <br>
            <p>
                But, I tried anyways, and finally, once everything was ready, I launched up <i>freerdp</i> and tried connecting to a KDE Plasma remote desktop.
            </p>
            <br>
            <p>
                Guess what? Black screen.
            </p>
            <br>
            
            <h3>Time for some debugging fun!</h3>
            <p>
                OK, time to DuckDuckGo it then. Unfortunately, I could not find a single working solution to this on the web. I even tried running xrdp in one of my Ubuntu VMs and it worked. Perfectly! I also tried starting single apps instead of Plasma, and that worked too, although the apps were often oddly sized. So, I was seriously confused what was wrong with exozyme's xrdp server.
            </p>
            <br>
            <p>
                The whole situation reminded me an awfully lot like the <a href="https://ta180m.exozy.me/blog/2021/06/22/anti-window-manager.html">Anti Window Manager</a>. What was the problem there? The truly despicable piece of software that is D-Bus. I haven't ever met a person that likes D-Bus. So, I tried running my remote KDE Plasma desktop with <i>dbus-run-session</i>, and it actually worked!
            </p>
            <br>
            <p>
                Unfortunately, it was a pretty broken experience. Audio didn't work, the logs were filled with D-Bus errors, Polkit didn't work, and there wasn't any graphical acceleration. But first, I swiftly documented my new fix on the ArchWiki so the next folks to try xrdp wouldn't have to suffer through the same problems. While I was at it, I also extensively cleaned up the article, and it looks <a href="https://wiki.archlinux.org/index.php?title=Xrdp&oldid=689493">beautiful now!</a>.
            </p>
            <br>
            <p>
                I ended up installing some extra Pulse modules and simply adding <i>pulseaudio &</i> to the startup script to get sound to work, although the PulseAudio processes sometimes don't get killed properly upon ending the remote desktop session. For graphical acceleration, a handy package in the AUR enabled it to work, too. Perfect! And of course, I contributed these fixes to the ArchWiki as well. I have no idea about the D-Bus errors or Polkit, but those aren't too important as far as I can tell.
            </p>
            <br>
            <p>
                Anyways, it's awesome that exozyme users can now effortlessly start up a remote desktop and things like sound, graphical acceleration, and even installing local apps with Flatpak and Discover work without any extra work. Another perk about RDP is that there's a built-in client for it on Windows, which makes things even easier for users. Of course, FreeRDP will always be the best client!
            </p>
            <br>
            
            <h3>No more memorizing a bunch of passwords</h3>
            <p>
                The annoying thing about hosting so many services is that they are way too many passwords to remember. Of course, I have my personal password generating algorithm, so it's not as much of an issue, but still, it's a ton of work to have so many accounts for each user and each service.
            </p>
            <br>
            <p>
                Enter the vast and disorienting world of single sign-on and directory management. There's just so many terms and accronyms thrown around about this: OAuth2, OpenID Connect, SAML, LDAP, Active Directory, 389, Keycloak, FreeIPA, and more. I decided to go for something as simple as possible. After a bad experience with using Nextcloud as a single sign-on (specifically, Nextcloud's not exactly compliant OAuth2), I decided to ask in some Matrix rooms about this, and several people endorsed Keycloak.
            </p>
            <br>
            <p>
                Fortunately, there's a decent ArchWiki entry for Keycloak this time, and it's surprisingly easy to use, although it presents a ridiculously large amount of configuration options. Yeah, forget about them, they aren't important, at least for my setup. I managed to get Nextcloud, Gitea, and Synapse integrated well, and I'm working on the others right now.
            </p>
            <br>
            <p>
                Alright! So you now only need to remember two passwords: Your Linux user password that you use for SSH, and your Keycloak password for all the web services. Of course, you could do it with only one password and LDAP, but that's a huge PITA and not torture that I want to put myself through. Plus, it's trivial now to only give someone access to SSH and remote desktop, or alternatively access only to the web services.
            </p>
            <br>
            
            <h3>So many services, where to start!</h3>
            <p>
                About that... I wrote a <a href="/quickstart">quickstart guide</a> to address this, but it may still contain some technical information that I copied over from the FUQs page. (I love that name) If you have any suggestions or feedback, feel free to leave them on <a href="https://github.com/exozyme/exozy.me">GitHub</a> or <a href="https://git.exozy.me/exozyme/exozy.me">Gitea</a>.
            </p>
            <br>
            
            <h3>The future</h3>
            <p>
                Take a look at our <a href="exozy.me/roadmap">roadmap</a> if you want a preview of the future. Thanks for reading yet another long and rambling exozyme blog post! See you when we hit 64 users! 😉
            </p>
            <br>
        </div>
    </body>
</html>
