### A Pluto.jl notebook ###
# v0.17.7

using Markdown
using InteractiveUtils

# ╔═╡ 462b98b8-8182-11ec-085a-850a7141205b
pkgname = split(read(`pacman -Sql`, String))

# ╔═╡ 86789bd1-393d-480d-a5bc-43f545906cb8
N = length(pkgname)

# ╔═╡ e100eae8-502a-4570-ab54-1bd1a26db7d5
struct Package
    provides::Vector{String}
    conflicts::Vector{String}
    size::Float64
end

# ╔═╡ e014fa4c-f82b-470e-b3bd-fde76b4673a6
pkginfo = Vector{Package}(undef, N)

# ╔═╡ 016da011-4300-40ac-a99b-682380d64ef9
Threads.@threads for i = 1:N
    pkg = pkgname[i]
    info = map(x -> split(replace(split(x, "\n")[1], "None" => "")), split(read(`pacman -Si $pkg`, String), " : "))
    push!(info[10], pkg)
    pkginfo[i] = Package(info[10], info[13], parse(Float64, info[16][1]))
end

# ╔═╡ 53be9679-e41e-4f35-83e6-9760f5196bf0
providedby = Dict{String, Vector{Int}}()

# ╔═╡ b7f48d11-f7ba-4490-9493-66dd2425f359
for i = 1:N
	for p in pkginfo[i].provides
		p = split(p, "=")[1]
		if !(p in keys(providedby))
			providedby[p] = Vector{Int}()
		end
		push!(providedby[p], i)
	end
end

# ╔═╡ 714946d5-1990-4c28-a9ca-07bd233b8441
G = [Set{Int}() for i = 1:N]

# ╔═╡ 9cb5db2f-728f-4d33-9eb9-7c9330a83bdf
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

# ╔═╡ ff60f482-5e78-406c-a1dd-cae826266fac
ans = BitSet(1:N)

# ╔═╡ 599c20b1-2922-4f5f-b67b-b4a72b558b21
used = BitSet()

# ╔═╡ 1ed271ee-5995-42e2-8033-85a9a34bb151
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

# ╔═╡ 2492b63a-9d4b-4e2e-964e-71f52fb2765d
open("out", "w") do f
	for i in ans
		println(f, pkgname[i])
	end
end

# ╔═╡ 00000000-0000-0000-0000-000000000001
PLUTO_PROJECT_TOML_CONTENTS = """
[deps]
"""

# ╔═╡ 00000000-0000-0000-0000-000000000002
PLUTO_MANIFEST_TOML_CONTENTS = """
# This file is machine-generated - editing it directly is not advised

julia_version = "1.7.1"
manifest_format = "2.0"

[deps]
"""

# ╔═╡ Cell order:
# ╠═462b98b8-8182-11ec-085a-850a7141205b
# ╠═86789bd1-393d-480d-a5bc-43f545906cb8
# ╠═e100eae8-502a-4570-ab54-1bd1a26db7d5
# ╠═e014fa4c-f82b-470e-b3bd-fde76b4673a6
# ╠═016da011-4300-40ac-a99b-682380d64ef9
# ╠═53be9679-e41e-4f35-83e6-9760f5196bf0
# ╠═b7f48d11-f7ba-4490-9493-66dd2425f359
# ╠═714946d5-1990-4c28-a9ca-07bd233b8441
# ╠═9cb5db2f-728f-4d33-9eb9-7c9330a83bdf
# ╠═ff60f482-5e78-406c-a1dd-cae826266fac
# ╠═599c20b1-2922-4f5f-b67b-b4a72b558b21
# ╠═1ed271ee-5995-42e2-8033-85a9a34bb151
# ╠═2492b63a-9d4b-4e2e-964e-71f52fb2765d
# ╟─00000000-0000-0000-0000-000000000001
# ╟─00000000-0000-0000-0000-000000000002
