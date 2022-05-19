---
title: "Totally Reproducible Arch"
date: 2022-05-18T19:38:43-05:00
description: "A single file containing my Arch Linux configuration to flex on all the NixOS noobs"
type: "post"
tags: ["linux", "arch", "nixos", "humor"]
---


To make a short story shorter, I had to return the [ThinkPad X1 Yoga Gen 6](laptopia) due to some manufacturing defects, but based on how high quality ThinkPads are, I got a replacement which was otherwise the same apart from more RAM, a larger disk, and an amazing 4K display. A 4K display on a 14 inch laptop is a glorious thing: it puts any other display to shame, you start seeing blurriness everywhere else you look, and your battery drains torrentially like it's on it's final cycle. More about that fantastic display later.

Before returning the "defective" ThinkPad, I think I committed at least a hundred crimes against that computer, such as breaking a freshly installed SUS lizard distro installation in only five minutes, or [theming KDE Plasma into Windows 11](https://social.exozy.me/@ta180m/108320859908513575). *Simple by default. Powerful by choice.* Wait...

It was fun while it lasted, but it also felt like one of the [most efficient time wasting sessions](installing-every-arch-package) I've had in a long time.

Anyways, when the laptop arrived, the first thing I did was disable secure boot because the sole purpose of secure boot is to make sure your computer feel safe that you won't suddenly torture it by installing some weird Linux distro on it. I booted up an Arch live ISO, because everyone these days has one in their pocket now, and started `archinstall`, the April Fool's day joke that actually turned out to be a good idea.

Oh oops, I need to connect to WiFi first... time to stumble with `iwctl` for a few minutes trying to theorize why the live ISO can't just use NetworkManager...

Alright, let's get `archinstall`ing!

So here's my `archinstall` config in a single JSON file, because Nix language? More like NIH language! JSON is known and loved by everywhere, and no one wants to learn a NIH language just to do some fancy functional package management.

Anyways, here it is in all its glory!

```json
{
    "audio": "pipewire",
    "bootloader": "systemd-bootctl",
    "config_version": "2.4.2",
    "debug": false,
    "desktop-environment": "kde",
    "gfx_driver": "Intel (open-source)",
    "harddrives": [
        "/dev/nvme0n1"
    ],
    "hostname": "ThinkPad-X1-Yoga-Gen-6",
    "kernels": [
        "linux-hardened"
    ],
    "mount_point": null,
    "nic": {
        "dhcp": true,
        "dns": null,
        "gateway": null,
        "iface": null,
        "ip": null,
        "type": "nm"
    },
    "packages": [
        "fish",
        "micro",
        "firefox",
        "ttf-bitstream-vera",
        "ttf-croscore",
        "ttf-dejavu",
        "ttf-droid",
        "ttf-ibm-plex",
        "ttf-liberation",
        "iio-sensor-proxy",
        "maliit-keyboard",
        "fprintd",
        "pacman-contrib",
        "xdg-desktop-portals",
        "gnome-keyring",
        "kde-system-meta",
        "kde-utilities-meta",
        "kde-graphics-meta",
        "fwupd",
        "power-profiles-daemon",
        "freerdp",
        "nextcloud-client",
        "hunspell-en_us",
        "dolphin-plugins",
        "noto-fonts-emojis",
        "mpv",
        "vlc",
        "tealdeer",
        "kdeconnect"
    ],
    "plugin": null,
    "profile": {
        "path": "/usr/lib/python3.10/site-packages/archinstall/profiles/desktop.py"
    },
    "script": "guided",
    "silent": false,
    "timezone": "America/Chicago",
    "version": "2.4.2"
}
```

Now I can see you all screaming at the obviously wrong choices that I made in that config. But worry not, I'll explain!

PipeWire and systemd-boot need no explanation because they are universally considered the best, especially since Arch users are all systemdphiles; otherwise they'd use Artix.

Now for the desktop environment, you all are probably all trying to shill your favorite WM at the moment, but let me enlighten you: DEs are WMs too. If your most hated DE didn't have a WM, it would just display a single app at all times, and they obviously don't do that, with the exception of GNOME which as far as I know, GNOME has absolutely zero configurability and thefore zero interactibility. So there you go. DEs are just WMs that very dumb and very smart Arch users use. As for KDE, I'm a [KDE contributor](fixing-bugs-isnt-hard) so I'm legally obligated to use KDE. No exceptions.

For the graphics drivers, I was very tempted to try the newly open-sourced Nvidia drivers, but I figured I probably wouldn't have much to talk about given my lack of Nvidia hardware.

I choose my NVME drive for the installation instead of the obvious choice, a RAM disk, because OSes installed on RAM disks are like `$FAMOUS_CELEBRITY`: they're perfect exactly once, and then they die and disappear from your memory.

The hostname was a tough choice. On the "defective" ThinkPad, I changed its hostname to "waifu" because that's how you treat a waifu. However, for this one I went down the boring route because no one wants to screenshare their terminal for everyone to see their cringy hostname in the terminal prompt. A wasted opportunity, I know...

For the kernel, I went with `linux-hardened`, because being paranoid is the only way to survive in today's internet.

Apparently no mount point because mounting disks is hard?

I remedied the Arch live ISO's lack of NetworkManager by disabling everything else and only using NetworkManager. Still, the live ISO was insistent of installing all the other network tools just in case, because apparently the live ISO hates NetworkManager or something?

Yay, now to the packages! Since explaining every package choice in detail would take up ten entire blog posts, I'll just write a blurb about each.

- `fish`: Zsh with good defaults
- `micro`: Nano with good defaults
- `firefox`: The best bad web browser
- `ttf-bitstream-vera`: Extra fonts
- `ttf-croscore`: More extra fonts
- `ttf-dejavu`: Even more extra fonts
- `ttf-droid`: Wow, maybe I shouldn't install so many extra fonts?
- `ttf-ibm-plex`: Nah, extra fonts good
- `ttf-liberation`: This enough?
- `iio-sensor-proxy`: So Plasma knows the best opportunity to automatically rotate my screen to drive me crazy
- `maliit-keyboard`: Wayland touch keyboard that malfunctions randomly all the time
- `fprintd`: Fingerprint sensor authentication because biometrics are scientifically proven to be 100% secure
- `pacman-contrib`: For everything that deserves to be part of pacman but isn't
- `xdg-desktop-portals`: So Firefox and KDE can be better friends
- `gnome-keyring`: To MITM my GPG agent
- `kde-system-meta`: More apps more bloat more fun
- `kde-utilities-meta`: Even more apps even more bloat even more fun
- `kde-graphics-meta`: Wow, maybe I shouldn't install so many apps?
- `fwupd`: To flex on all the poor souls that need Windows to update firmware
- `power-profiles-daemon`: To turn on the performance power profile to drain my battery faster
- `freerdp`: To escape my terrible Arch installation via remote desktop
- `nextcloud-client`: To sync all my anime folders
- `hunspell-en_us`: I have perfect speling but you never know
- `dolphin-plugins`: Tiny cute checkmark icons for Dolphin!
- `noto-fonts-emojis`: Because emojis were the only good use ever invented for Unicode, [wait...](https://social.exozy.me/@ta180m/108258173448889466)
- `mpv`: To play videos in the terminal
- `vlc`: Also to play videos in the terminal
- `tealdeer`: Because I still don't know how to use Linux
- `sof-firmware`: Because I like to hear things
- `kdeconnect`: Because it's awesome

Cool, go that out of the way.

There's one notable thing that isn't in the config file, because disk partitioning is too hard. I'm using btrfs!

For the uninitiated, btrfs is an accronym for bEtrAYAL fILEsYSTEM. It is a very stable genius filesystem with a number of extremely advanced features unmatched by any other, such as reliable and automated filesystem corruption and a strategic lack of encryption so law enforcement can keep people safe by reading your files. Since all criminals are dumb and I'm not, I enabled disk encryption in `archinstall`, but disk partitioning is too hard and it didn't make it to the config file. Anyways, btrfs has a very special feature that will make all NixOS users as envious as the color of my profile picture. Say cheese!

btrfs snapshots are obviously so much more superior than anything NixOS can do. Imagine only being able to rollback to only the moments when you updated your system! Imagine not being able to take a snapshot whenever you feel like it at 3 AM when you're too tired to update your system! That is the sad like of a NixOS user. (Did you say you can use btrfs on NixOS? Don't listen to that heresay.)

Anyways, time to cover all the post-installation tweaks I did! Look at me, I'm listing every tweak I did in a single file so my installation is 100% reproducible! According to [this one random website that has a very not-sketchy looking domain name](https://r13y.com/), even the minimal installation image is only 99.87% reproducible. Don't make this elementary math mistake: 99.87% reproducible does not mean 99.87% reproducible. 99.87% reproducible actually means 0% repoducible! That's because all the smart math geniuses know that if something's not 100% reproducible, there's a 0% chance it's going to look the exact same when you try to reproduce it! Therefore, it's 0% reproducible!

What a shocker, NixOS is only 0% reproducible! And look at my amazing Arch installation, clocking in at 100% reproducibility since I put all my tweaks in this single file!

OK, so here we go:

- Changed my shell to `/bin/fish`
- Connected to WiFi using the godly NetworkManager
- Enabled Wayland for Firefox with an environment variable
- Synced my Firefox profile and rearranged the UI since sync always messes it up
- Did some *dangerous* `about:config` Firefox tweaks to disable the IQ-destroying thing known as Pocket and enabled XDG portals so Firefox can finally be friends with KDE
- Changed the KDE Plasma theme to the Breeze Twilight theme since hybrid themes bring out the best of both worlds
- Cloned dotfiles and symlinked them
- Downloaded SSH and GPG keys from my server and set up `gnome-keyring` (always very tricky, create a `~/.gnupg/gpg-agent.conf` file with `pinentry-program pinentry-gnome3` which can later be deleted)
- Enabled the legendary Ctrl-Alt-T shortcut for Konsole and removed the hideous Konsole toolbars
- Tweaked `/etc/pacman.conf` to get everyone's favorite parallel downloads and the `ILoveCandy` easter egg
- Set the timeout to 0 for systemd-boot so I don't have to waste precious seconds of my life looking at the systemd-boot boot screen
- Installed paru by scp-ing it from my server
- Enabled some desktop effects to make KDE Plasma look truly glorious, such as wobbly windows and fall apart
- Enabled maliit-keyboard even though it breaks every time
- Set Caps Lock to Compose because no one ever uses Caps Lock
- Enabled pacman-contrib timers that should totally be part of pacman
- Reversed mouse scroll direction to the ideologically correct direction and made my touchpad hypersensitive and my trackpoint hyposensitive
- Removed a lot of the auto-installed stuff like `htop` and `wget`
- Installed `base-devel-meta` and `waypipe` from the spooky spooky AUR without first reading their PKGBUILDs
- Used the Breeze theme for SDDM so it doesn't look terrible and wasted time getting it to scale for the glorious 4K screen
- Added some virtual desktops (not to be confused with remote desktops) and rearranged the bottom Plasma toolbar to be more efficient
- Configured the totally secure and safe fingerprint reader
- Installed firmware updates with `fwupd` and rebooted a few times
- Changed units to the ideologically correct metric system
- Configured Dolphin in numerous tiny ways such as enabling trash autodelete, the Git plugin, and making the left sidebar contain actually useful folders like some `sftp` connections
- Changed `XDG_DESKTOP_DIR` and `XDG_DOWNLOAD_DIR` to `~` because I always get those three folders confused
- Synced all my Nextcloud stuff (with virtual files of course) and symlinked it to my `~` and deleted the autostart file that Nextcloud uses to sneakily start up every time I start Plasma
- Configured audio volume and mics so my ears don't get blasted out but my mic causes other people's ears to get blasted out
- Set up KDE Connect between this computer and my other devices
- Configured the KDE application launcher favorites to be my actual favorite apps instead of what KDE thinks my favorite apps are
- Enabled more KDE and kwin shortcuts so I can feel safe that my WM is keyboard-driven when the WM supremacists start insulting KDE
- Turned down the screen brightness because this glorious 4K screen is too powerful and battery-draining!

Cool, that was it! Not too bad, right? And I did it in only 190 lines, unlike the thousand line configs that NixOS users always have.

I hope this post has helped you recognize that [Arch is the best](https://wiki.archlinux.org/title/Arch_is_the_best) and aspriring wannabes like NixOS have no shot at being better than Arch. That's also why I'm currently working on [better Nix integration for my Arch server](https://git.exozy.me/exozyme/exozyme/releases/tag/v8.3) and possibly switching the OS to NixOS.
