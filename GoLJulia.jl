import Pkg
using Pkg
using Plots
using Random
using Colors
#dimentions of grid
x = 100
y = 100
neighbors = 0
x::Int
y::Int
xx = x+1
yy = y+1
xxx = x-1
yyy = y-1
neighbors::Int
matrixA = zeros(x,y)

function createGrid(x,y)
    """ 
    createGrid(x,y)

    Develop random population of matrixA(x,y)
    """
    for i in 1:x
        for j in 1:y
                matrixA[i,j] = rand((0,1))
            j = j+1
        end
        i = i+1
    end
end
createGrid(x,y)
print(matrixA)

function kneighbors(x,y)

    for i in 2:xxx
        for j in 2:yyy
            j1 = j+1
            if matrixA[i,j1] == NaN
            end
            if matrixA[i,j1] == 0
            x1 = 0
            elseif matrixA[i,j1] == C_NULL
                x1 = 0
            else x1 = 1
            end
            i1 = i+1
            if matrixA[i1,j] == 0
                x2 = 0
            elseif matrixA[i1,j] == C_NULL
            else x2 = 1
            end
            j2 = j-1
            if matrixA[i,j2] == 0
                    x3 = 0
            elseif matrixA[i,j2] == C_NULL
            else x3 = 1
            end
            i2 = i-1
            if matrixA[i2,j] == 0
                         x4 = 0
            elseif matrixA[i2,j] == C_NULL
            else x4 = 1
            end
        neighbors = x1+x2+x3+x4
        end
    end
end
#new cell value
function cellRefresh()
    for i in 1:x
        for j in 1:y
            kneighbors(i,j)
            if matrixA[i,j] == C_NULL
            elseif neighbors == 3
            matrixA[i,j] = 1
            elseif neighbors == 2
            matrixA[i,j] = matrixA(i,j)
            elseif neighbors > 3
            matrixA[i,j] = 0
            elseif neighbors < 2
            j = j+1
            else
            end
        end
        i = i+1
    end
end
#plot(Gray.(matrixA))
n = 20
@gif for i in 1:n
    cellRefresh()
    plot(Gray.(matrixA))
end every 5
