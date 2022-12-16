import Pkg
using Pkg
Pkg.add("Pandas")
Pkg.add("Plots")
Pkg.add("Clustering")
Pkg.add("StatsPlots")
Pkg.add("DataFrames")
Pkg.add("RDatasets")
Pkg.add("PlotlyJS")
Pkg.add("CSV")
Pkg.add("HTTP")
using Plots, CSV, HTTP, DataFrames
using Clustering

# Native Plotting
#plot!(title = "New Title", xlabel = "New xlabel", ylabel = "New ylabel")
#plot!(xlims = (0, 5.5), ylims = (-2.2, 6), xticks = 0:0.5:10, yticks = [0,1,5,10])
function f(x, y)
    r = sqrt(x^2 + y^2)
    return cos(r) / (1 + r)
end
x = range(0, 2π, length = 30)
heatmap(x, x, f, c = :roma)

# Plotting from dataset in R (quantatative data)
using RDatasets, StatsPlots
iris = dataset("datasets", "iris")
@df iris marginalhist(:PetalLength, :PetalWidth)

