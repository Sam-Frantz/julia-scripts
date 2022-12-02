import Pkg
using Pkg
Pkg.add("Pandas")
Pkg.add("Plots")
Pkg.add("StatsPlots")
Pkg.add("DataFrames")
Pkg.add("RDatasets")
using Plots

# Native Plotting
#plot!(title = "New Title", xlabel = "New xlabel", ylabel = "New ylabel")
#plot!(xlims = (0, 5.5), ylims = (-2.2, 6), xticks = 0:0.5:10, yticks = [0,1,5,10])

# Plotting from dataset in R (quantatative data)
using RDatasets, StatsPlots
iris = dataset("datasets", "iris")
@df iris marginalhist(:PetalLength, :PetalWidth)