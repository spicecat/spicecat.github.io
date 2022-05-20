---
title: "How to Hibernate"
date: 2021-01-04
draft: true
type: "post"
tags: ["Linux"]
---


*Originally posted on my [old blog](https://git.exozy.me/Ta180m/blog/src/branch/main/_posts/2021-01-04-how-to-hibernate.md)*


If you dual-boot, hibernation is a necessity. Need to use the other OS for a few minutes? No problem, just hibernate, and when you boot your original OS again, you'll be back where you left off.

However... It's 2021 and there still isn't an easy way to enable hibernation on Linux. Sad.

Anyways, here's a rough outline of the procedure using a swap file:

## Make a swap file

You generally want your swap file to be at least as big as your RAM, and if you do a lot of swap-intensive stuff, you might even need a bigger swap file.

```sh
# create a swap file
sudo swapoff -a # disable all swap
sudo dd if=/dev/zero of=/swapfile bs=1M count=8196 status=progress # create a 8GiB swap file
sudo chmod 0600 /swapfile
sudo mkswap /swapfile
sudo swapon -a # enable swap

# add it to /etc/fstab
sudo sed -i '/swap/{s/^/#/}' /etc/fstab
sudo tee -a /etc/fstab<<<"/swapfile  none  swap  sw 0  0"
```

## Set kernel parameters

```sh
# get the resume parameters
RESUME_PARAMS="resume=UUID=$(findmnt / -o UUID -n) resume_offset=$(sudo filefrag -v /swapfile|awk 'NR==4{gsub(/\./,"");print $4;}') "

# add them to GRUB config
if grep resume /etc/default/grub>/dev/null; then echo -e "\nERROR: Hibernation already configured. Remove the existing configuration from /etc/default/grub and add these parameters instead:\n$RESUME_PARAMS";else sudo sed -i "s/GRUB_CMDLINE_LINUX_DEFAULT=\"/GRUB_CMDLINE_LINUX_DEFAULT=\"$RESUME_PARAMS/" /etc/default/grub;fi

sudo update-grub # for Debian-based distros
sudo grub-mkconfig -o /boot/grub/grub.cfg # for Arch
```

If you're using Arch, make sure you also [configure the initramfs](https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate#Configure_the_initramfs).


And... that's it!

If you have problems, make sure secure boot is disabled and check your BIOS settings. NVIDIA drivers are also problematic. If you're stuck, the internet can probably help.


Further reading:
 
 - [Tutorial for swap files](https://forums.linuxmint.com/viewtopic.php?t=284100)
 
 - [Tutorial for swap partitions](https://forums.linuxmint.com/viewtopic.php?f=42&t=273202)
 
 - [From the ArchWiki](https://wiki.archlinux.org/index.php/Power_management/Suspend_and_hibernate)
 
