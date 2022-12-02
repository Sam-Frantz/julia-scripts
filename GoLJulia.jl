import Pkg
using Plots
using Random
x = zeros[100, 100]
#develop random population of x
neighbors = 0
    function kneighbors(x)
        
        if x[0,+1] = 0
            x1 = 0
        else x1 = 1
            if x[+1,0] = 0
                x2 = 0
            else x2 = 1
                if x[0,-1] = 0
                    x3 = 0
                else x3 = 1
                    if x[-1,0] = 0
                        x4 = 0
                    else x4 = 1
                    end
                end
            end
        end
        neighbors = x1+x2+x3+x4
    end

    for i in 1:100
        if neighbors = 2
            x = 1
        elseif x > 2
            x = x
        else
            x = 0
        i = i+1
