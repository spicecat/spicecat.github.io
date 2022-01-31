---
title: "Installing Every Arch Package"
date: 2022-01-26T21:52:58-06:00
draft: true
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
pacman -Sql | xargs sudo pacman -S
```

10 seconds later, you'll find yourself with... unresolvable package conflicts detected?

OK, fine, let's disable dependency checking then:
```sh
pacman -Sql | xargs sudo pacman -Sdd
```

Nope, didn't work. We have to do something about the conflicting packages!

We could resolve all the conflicts manually with an hour of work... or we could write a program!

![Automation](https://imgs.xkcd.com/comics/automation.png)

## Time for some algorithms!

It's time to put our algorithms knowledge to good use. This is *just* a graph We can think of each package as a node in a graph and each conflict is an edge. Since we don't care about dependency checks (which would make for a likely broken system), we don't need to add any other edges to the graph.

For each edge, we need to pick at most one package, but not both. That sounds a lot like a [maximum independent set](https://en.wikipedia.org/wiki/Maximum_independent_set)!

Wait... it's NP hard though? And we have up to 12000 nodes, so we'll never be able to find the answer before the heat death of the universe, right?

Well, do we have 12000 *connected* nodes? No, since the largest connected component is probably only a few nodes. We aren't going to have hundreds or thousands of packages all conflicting with each other.

## Implementing this in Julia

We're going to use [Julia](https://julialang.org/) for implementing this algorithm, since Julia is Python but better. We first need to get a list of all packages:
```jl
pkgname = split(read(`pacman -Sql`, String))

N = length(pkgname)
```

Now, we'll get info about each package, using multithreading to speed things up:
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

Now we can find each connected component using [BFS](https://en.wikipedia.org/wiki/Breadth-first_search), and brute-force the maximum independent set by trying every subset of the nodes in that component. It's implemented here using some bit manipulation trickery.
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

Alright, time to install everything! This takes about 30 minutes depending on your internet connection. Make sure you have the `multilib` repository enabled, and you may manually need to install `iptables-nft` before running this command.
```sh
cat out | xargs sudo pacman -Sdd --noconfirm
```
