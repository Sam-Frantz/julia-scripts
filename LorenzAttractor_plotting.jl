import Pkg
using Pkg; Pkg.add("Random")
using Pkg; Pkg.add("Plots")
# Initializes plotting packages for visualization (supported in HTML)
using Agents
using AgentsPlots
using Plots
using Random



Base.@kwdef mutable struct Lorenz
    dt::Float64 = .02
    a::Float64 = 10
    b::Float64 = 28
    c::Float64 = 8/3
    x::Float64 = 1
    y::Float64 = 1
    z::Float64 = 1
end
 
function lorenzeq(l::Lorenz)
    dx = l.a * (l.y - l.x)
    dy = l.x * (l.b - l.z) - l.y
    dz = l.x * l.y - l.c * l.z
    l.x += l.dt * dx 
    l.y += l.dt * dy
    l.z += l.dt * dz
end

attractor = Lorenz()

plt = plot3d(
    1,
    xlim = (-30, 30),
    ylim = (-30, 30),
    zlim = (0, 60),
    title = "Lorenz Attractor",
    legend = false,
    marker = 2,
)

@gif for i=1:2000
    lorenzeq(attractor)
    push!(plt, attractor.x, attractor.y, attractor.z)
end every 10

#plot(args...; kw...)                  # creates a new Plot, and set it to be the `current`
#plot!(args...; kw...)                 # modifies Plot `current()`
#plot!(plt, args...; kw...)            # modifies Plot `plt`