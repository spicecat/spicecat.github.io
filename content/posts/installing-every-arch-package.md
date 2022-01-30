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
packages = split(read(`pacman -Sql`, String))
n = length(packages)
idx = Dict(packages[i] => i for i = 1:n)
```

Now, we'll get info about each package:
```jl
struct Package
    provides::Vector{String}
    conflicts::Vector{String}
    size::Float64
end

info = Vector{Package}()

Threads.@threads for i = 1:n
    package = packages[i]
    r = map(x -> split(split(x, "\n")[1]), split(read(`pacman -Si $package`, String), " : "))
    push!(info, Package(r[10], r[13], parse(Float64, r[16][1])))
end
```

We need special handling for [virtual packages](https://wiki.archlinux.org/title/Pacman#Virtual_packages):
```jl
virtual = Dict{String, Vector{String}}()

for i = 1:n
	for p in info[i].provides
		if !(p in keys(virtual))
			virtual[p] = Vector{String}()
		end
		push!(virtual[p], packages[i])
	end
end
```

We can use this to construct the graph:
```jl
graph = [Vector{Int}() for i = 1:n]

for i = 1:n
	for c in info[i].conflicts
		if c in keys(idx)
			push!(graph[i], idx[c])
			push!(graph[idx[c]], i)
		elseif c in keys(virtual)
			for v in virtual[c]
				push!(graph[i], idx[v])
				push!(graph[idx[v]], i)
			end
		end
	end
end
```