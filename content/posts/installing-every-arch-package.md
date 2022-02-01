---
title: "Installing Every Arch Package"
date: 2022-01-26T21:52:58-06:00
description: "Using algorithms and Julia to install as many packages as possible from the Arch Linux official repositories"
type: "post"
tags: ["linux", "fun", "algorithms", "computer-science"]
---


![A stupid idea on Matrix](/images/install-every-arch-package-matrix.png)

Challenge accepted. Let's do it!

First things first, let's generate a list of [all official Arch Linux packages](https://archlinux.org/packages/). Fortunately, `pacman`, the best pragmatic package manager in existence, makes this a breeze.
```sh
pacman -Sql
```

Great, now let's install it all!
```sh
sudo pacman -S $(pacman -Sql)
```

10 seconds later, you'll find yourself with... unresolvable package conflicts detected?

OK, fine, let's disable dependency checking then:
```sh
sudo pacman -Sdd $(pacman -Sql)
```

Nope, didn't work. We have to do something about the conflicting packages!

We could resolve all the conflicts manually with an hour of work... or we could write a program!

![Automation](https://imgs.xkcd.com/comics/automation.png)


## Time for some algorithms!

It's time to put our algorithms knowledge to good use. This is *just* a graph We can think of each package as a node in a graph and each conflict is an edge. Since we don't care about dependency checks (which would make for a likely broken system but who cares), we don't need to add any other edges to the graph.

For each edge, we need to pick at most one package, but not both. That sounds a lot like a [maximum independent set](https://en.wikipedia.org/wiki/Maximum_independent_set)!

Wait... it's NP hard though? And we have up to 12000 nodes, so we'll never be able to find the answer before the heat death of the universe, right?

Well, do we have 12000 *connected* nodes? No, since the largest connected component is probably only a few nodes. We aren't going to have hundreds or thousands of packages all conflicting with each other. Therefore, we don't need to prove [P = NP](https://en.wikipedia.org/wiki/P_versus_NP_problem) to be able to find the maximum independent set of this particular graph. Phew!


## Implementing this in Julia

We're going to use [Julia](https://julialang.org/) for implementing this algorithm, because Julia is Python but better. We first need to get a list of all packages:
```jl
pkgname = split(read(`pacman -Sql`, String))

N = length(pkgname)
```

Now, we'll get info about each package, using multithreading to speed things up: (this is the slowest part of the program, actually)
```jl
struct Package
    provides::Vector{String}
    conflicts::Vector{String}
    size::Float64
end

pkginfo = Vector{Package}(undef, N)

Threads.@threads for i = 1:N
    pkg = pkgname[i]
    info = map(x -> split(replace(split(x, "\n")[1], "None" => "")), split(read(`pacman -Si $pkg`, String), " : "))
    push!(info[10], pkg)
    pkginfo[i] = Package(info[10], info[13], parse(Float64, info[16][1]))
end
```

We need special handling for [virtual packages](https://wiki.archlinux.org/title/Pacman#Virtual_packages):
```jl
providedby = Dict{String, Vector{Int}}()

for i = 1:N
	for p in pkginfo[i].provides
		p = split(p, "=")[1]
		if !(p in keys(providedby))
			providedby[p] = Vector{Int}()
		end
		push!(providedby[p], i)
	end
end
```

We can use this to construct the graph:
```jl
G = [Set{Int}() for i = 1:N]

for i = 1:N
	for p in pkginfo[i].conflicts
		if p in keys(providedby)
			for j in providedby[p]
				if j != i
					push!(G[i], j)
					push!(G[j], i)
				end
			end
		end
	end
end
```

Now we can find each connected component using [BFS](https://en.wikipedia.org/wiki/Breadth-first_search), and brute-force the maximum independent set by trying every subset of the nodes in that component. It's implemented here using some bit manipulation trickery. Since the components are all very small, the brute-force finishes really quickly!
```jl
ans = BitSet(1:N)

used = BitSet()

for i = 1:N
	if !(i in used)
		push!(used, i)
		component = Vector{Int}()
		queue = Vector{Int}([i])
		while !isempty(queue)
			u = popfirst!(queue)
			push!(component, u)
			for v in G[u]
				if !(v in used)
					push!(used, v)
					push!(queue, v)
				end
			end
		end

		M = length(component)
		best = (0, 0.0, 0)
		for m = 1:(1<<M)-1
			good = true
			for j = 1:M
				if (m>>(j-1))&1 == 1
					for k = j+1:M
						if (m>>(k-1))&1 == 1 && component[j] in G[component[k]]
							good = false
						end
					end
				end
			end
			if !good
				continue
			end

			cnt = length([j for j = 1:M if (m>>(j-1))&1 == 1])
			size = sum([pkginfo[component[j]].size for j = 1:M if (m>>(j-1))&1 == 1])
			best = max((cnt, size, m), best)
		end

		for j = 1:M
			if (best[3]>>(j-1))&1 != 1
				delete!(ans, component[j])
			end
		end
	end
end
```

Let's save it to a file:
```jl
open("out", "w") do f
	for i in ans
		println(f, pkgname[i])
	end
end
```


## Installing everything

Alright, time to install everything! It'll take about 30 minutes for everything to download, depending on your internet connection. Make sure you have the `multilib` repository enabled. We can also speed this up by disabling package signature checking.
```sh
sudo pacman -Sdd $(cat out)
```

After everything finishes downloading, we get a bunch more errors?
```
error: failed to commit transaction (conflicting files)
Errors occurred, no packages were upgraded.
```

Normally this isn't a good idea, but since we don't care if we end up with a broken system, let's tell `pacman` to ignore all conflicting files:
```sh
sudo pacman -Sdd $(cat out) --overwrite '*'
```

What? Yet another error?
```
(12232/12232) checking for file conflicts                          [####################################] 100%
(12232/12232) checking available disk space                        [####################################] 100%
error: Partition / too full: 44153437 blocks needed, 32623558 blocks free
error: not enough free disk space
error: failed to commit transaction (not enough free disk space)
Errors occurred, no packages were upgraded.
```

I don't have enough disk space? NOOOOOOOO!!!!!

Fortunately, [ncdu](https://dev.yorhel.nl/ncdu) makes it extremely easy to clean up some disk space.

Let's try again:
```
(12232/12232) checking for file conflicts                          [####################################] 100%
(12232/12232) checking available disk space                        [####################################] 100%
error: Partition / too full: 46765827 blocks needed, 44965573 blocks free
error: not enough free disk space
error: failed to commit transaction (not enough free disk space)
Errors occurred, no packages were upgraded.
```

I still don't have enough? Fine, let's install the largest 100 packages first, and then delete them from the cache to reduce our disk usage.
```
cd /var/cache/pacman/pkg
sudo pacman -Udd $(ls -S | head -n 100)
sudo rm $(ls -S | head -n 100)
```

Now let's try again:
```sh
sudo pacman -Sdd $(cat out) --overwrite '*' --needed
```

Success! Now, time for yet another 30 minute wait, and even better, there's *52* `pacman` hooks at the end. Yeah, we'll just have to wait as every DKMS module is compiled for each of the four kernels we have installed.


## Exploring the system

Alright, let's reboot and check out our new and improved Arch Linux system!

The first obstacle that we encounter is that most display managers, with the exception of [LXDM](https://wiki.archlinux.org/title/LXDM), don't have a scrollbar for selecting the desktop session (Because when would you ever have that many sessions installed?). So, let's `sudo systemctl start lxdm` and choose one of the 44 desktop sessions to explore.

![A very bloated LXDM](/images/bloated-lxdm.png)

Surprisingly, KDE Plasma starts up pretty snappily, but 10 different background services also popped up in the system tray. Memory usage is pretty high, but what can you expect? We also have over 30 different terminals to choose from for our `neofetch` screenshot.

![A very bloated KDE](/images/bloated-kde.webp)

Now let's have some real fun with this system:

![All apps](/images/all-apps.webp)

Endless fun!


## So is this system usable?

Surprisingly, yes! It's hard to judge how bad the performance really is, since it's in a virtual machine, but all the software that I tested was definitely usable. It's somewhat slow, but that's exactly what you'd expect. As we used a lot of unsafe hacks (disabling dependency and file conflict checking, for instance) to get this to actually work, I wouldn't recommend using this system for anything other than proving it's possible.

Now is this useful? The short answer is no. The long answer is also no. I can think of exactly zero uses of this experiment (and I must be pretty crazy for doing it).


## I want to try this out!

Uh, don't do it, but if you insist, you need a fresh new Arch Linux system, 250 GB of free disk space, Julia, a boatload of patience, and a healthy dose of insanity. You can download the Julia code as a [Pluto notebook](/src/solveconflicts.jl) and run it with `julia --threads=auto solveconflicts.jl`. I'd recommend doing the actual installation (`sudo pacman -Sdd $(cat out) --overwrite '*' --needed`) in a VM since this completely destroys an Arch Linux system, and there's no going back once you finish.

And before you start, please ask yourself three times, why am I doing this???


## Further potential explorations

- Install every package of a different distro? In particular, I'd like to see someone do this for Ubuntu, Debian, and NixOS and watch them suffer. This was painful enough.

- Investigate the file conflicts and file some Arch Linux [bugs](https://bugs.archlinux.org/task/73574).

- Figure out how to make `pacman` skip all package conflict checks, possibly by editing the `pacman` source code and disabling the relevant code that does these checks, so we can *really* install every single Arch package.

- Build a time machine so I can get back the 10 hours that I wasted by doing this project. (I also destroyed 6 testing VMs) Oh well. Now we know what really happens when you install all Arch Linux packages!
