#%% Introduction
print("Hello world")
println(42)

#%% Variables and Types
my_name = "Samuel"
my_favorite_number = "42"
my_favorite_pie = "3.1415"
print(my_name)

#%%
a = 2
b = 3
 sum = a + b
 difference = a - b
 product = a * b
 quotient = b / a
 power = a^3
 modulus = b % a
 #%%
 typeof(0.1)
 typeof(42)
 typeof("Hello")
 #%%
 a = 2 # if we need to operate with ints
 b = 2.0 # if we need to operate with floats
 #%%
 convert(Float64, 2)

 a = 2
 b = convert(Float64, a)

 a

 b

 #%% Funcitons
 function plus_two(x)
    #perform some operations
    return x + 2
 end
 y = plus_two(1)
 print(y)
 #%%
 using Pkg
 Pkg.add("QuadGK")
using QuadGK

f(x,y,z) = (x^2 + 2y)*z

quadgk(x->f(x,42,4), 3, 4)
#%%
function myWeight(weightOnEarth, g=9.81)
    return weightOnEarth*g/9.81
end
myWeight(60, 3.72)

#%% Data Structures
a = [1,2,3,4,5]
b = [1.2, 3,4,5]
c = ["Hello", "it's me", "Samuel"]
# append!(a,6) means a = [1,2,3,4,5,'6']
append!(a, 100)
print(a)
#%%
d = Int[1,2,3,4,5]
mat1 = [1,2,3;4,5,6]
#%%
table = zeros(2,3,4)
for k in 1:4
    for j in 1:3
        for i in 1:2
            table[i,j,k] = i*j*k
        end
    end
end
print(table)
#%%
# slicing
a = [1,2,3,4,5,6]
b = a[2:5]

mat1 = reshape([i for i in 1:16],4,4)
mat2 = mat1[2:3, 2:3]
println(mat1)
println(mat2)
#%%
mat3 = [i+j for i in 1:10 for j in 1:5]
print(mat3)
#%%
a = [1,2,3]
b=a
b[2] = 42
print(a)
#%%
a = (1,2,3)
b = 1, 2, 3
tuple1 = (1, 2, 3)
a, b, c = tuple1
print("$a, $b, $c")
#%%
function return_multiple()
    return 42, 43, 44
end

a, b, c = return_multiple()
print("$a, $b, $c")
#%%
function splat_me(a,b,c)
    return a*b*c
end

tuple1 = (1,2,3)

splat_me(tuple1...)
#%%
# Named tuples
namedTuple1 = (a = 1, b = "hello")
(a = 1, b = "hello")

namedTuple1[:a]
namedTuple1[:b]

namedTuple2 = NamedTuple{(:a, :b)}((2, "hello2"))
(a = 2, b = "hello2")

namedTuple2[:a]
namedTuple2[:b]
#%%
person1 = Dict("Name" => "Samuel", "Phone" => 123456789, "Shoe-size" => 42)
person2 = Dict("Name" => "Timothy", "Phone" => 123456789, "Shoe-size" => 42)
addressBook = Dict("Samuel" => person1, "Timothy" => person2)
person3 = Dict("Name" => "Jillian", "Phone" => 123456789, "Shoe-size" => 42)
addressBook["Jillian"] = person3
print(addressBook)
#%% Control Flow
function absolute(x)
    if x >= 0
        return x
    else
        return -x
    end
end

#example if
if 1< 3 & 3 < 4
    print("eureka!")
end

x = 42
if x<1
    print("$x <1")
elseif x < 3
    print("$x < 3")
elseif x < 100
    print("$x < 100")
else print("$x > 100")
end
#%%
persons = ["Alice", "Bob", "Carla", "Daniel"]
for person in persons
    println("Hello $person, welsome to class")
end
#%%
for i in 1:100
    if i>10
        break
    else
        println(i^2)
    end
end
#%%
for i in 1:30
    if i % 3 == 0
        continue
    else
        println(i)
    end
end
#%%
function while_test()
    i=0
    while(i<30)
        println(i)
        i += 1
    end
end
while_test()
#%%
x = ["a", "b", "c", "d"]
for couple in enumerate(x)
    println(couple)
end
#%%
my_array1 = collect(1:10)
my_array2 = zeros(10)
for (i, element) in enumerate(my_array1)
    my_array2[i] = element^2
end
print(my_array2)
#%%

a = [1,2,3]
b = [4,5,6]

a*b

c = [4 5 6]

d = a*c
print(d)
#Note a*b does not exist due to dimentions not aligned
c*a
e = reshape([1,2,3,4,5,6,7,8,9],3,3)
g = e*a
print(g)

a .* c

c .* a

a .* e

#%%

a = [1,2,3]
sin.(a)

#%%

function example1()
    z = 42
    return
end

function example2()
    global z = 42
    return
end

function example3()
    z = 42
    return z
end

a = let
    i=3
    i+=5
    i
end

b = let i=5
    i+=42
    i
end

c = let i=10
    i+=42
    i
end

#note i is undefined as 'let' function contains the variable to local env
#%%
d = begin
    i = 41
    i+=1
    i
end
#note i is defined in global using 'begin'
#%%

module ScopeTestModule
export a1
a1 = 25
b1 = 42
end

using .ScopeTestModule
#%%
using Pkg
Pkg.add("SpecialFunctions")

using SpecialFunctions
#ex. gamma(3) ,  sinint(5)
#%%
module MyModule
export func2

a=42
function func1(x)
    return x^2
end

function func2(x)
return func1(x) + a
end

end
#%%
using .MyModule

#%%

include("big-module.jl")

using .MyBigModule

@doc raw"""
    func2big(x)

Computes the square of `x` and add `a` to it.

# Examples
​```julia-repl
julia> include("big-module.jl")
julia> using .MyBigModule
julia> func2big(3)
51
​```
"""
function func2big(x)
    return func1big(x) + a
end

#%%
#Types and Structures
abstract type Person
end

abstract type Musician <: Person
end

mutable struct Rockstar <: Musician
    name::String
    instrument::String
    bandName::String
    headbandColor::String
    instrumentsPlayed::Int
end

struct ClassicMusician <: Musician
    name::String
    instrument::String
end

mutable struct Physicist <: Person
    name::String
    sleepHours::Float64
    favoriteLanguage::String
end

aure = Physicist("Aurelio", 6, "Julia")

aure.sleepHours = 8

aure_musician = ClassicMusician("Aurelio", "Violin")

#note, if trying to change instrument in terminal, unable as classicmusician is immutable struct
ricky = Rockstar("Riccardo", "Voice", "Black Lotus", "red", 2)

function introduceMe(person::Person)
    println("Hello, my name is $(person.name).")
end

function introduceMe(person::Musician)
    println("Hello, my name is $(person.name) and I play $(person.instrument).")
end

function introduceMe(person::Rockstar)
    if person.instrument == "Voice"
        println("Hello, my name is $(person.name) and I sing.")
    else
        println("Hello, my name is $(person.name) and I play $(person.instrument).")
    end
    println("My band name is $(person.bandName) and my favourite headband colour is $(person.headbandColor)!")
end

mutable struct MyData
    x::Float64
    x2::Float64
    y::Float64
    z::Float64
    function MyData(x::Float64, y::Float64)
        x2 = x^2
        z = sin(x2+y)
        new(x, x2, y, z)
    end
end

mutable struct MyData2{T<:Real}
    x::T
    x2::T
    y::T
    z::Float64
    function MyData2{T}(x::T, y::T) where {T<:Real}
        x2 = x^2
        z = sin(x2+y)
        new(x, x2, y, z)
    end
end

module TestModuleTypes

export Circle, computePerimeter, computeArea, printCircleEquation

mutable struct Circle{T<:Real}
	radius::T
	perimeter::Float64
	area::Float64

	function Circle{T}(radius::T) where T<:Real
		# we initialize perimeter and area to -1.0, which is not a possible value
		new(radius, -1.0, -1.0)
	end
end

@doc raw"""
	computePerimeter(circle::Circle)

Compute the perimeter of `circle` and store the value.
"""
function computePerimeter(circle::Circle)
	circle.perimeter = 2*π*circle.radius
	return circle.perimeter
end

@doc raw"""
	computeArea(circle::Circle)

Compute the area of `circle` and store the value.
"""
function computeArea(circle::Circle)
	circle.area = π*circle.radius^2
	return circle.area
end

@doc raw"""
	printCircleEquation(xc::Real, yc::Real, circle::Circle )

Print the equation of a cricle with center at (xc, yc) and radius given by circle.
"""
function printCircleEquation(xc::Real, yc::Real, circle::Circle )
	println("(x - $xc)^2 + (y - $yc)^2 = $(circle.radius^2)")
	return
end
end # end module

#%%

using .TestModuleTypes

circle1 = Circle{Float64}(5.0)

computePerimeter(circle1)
circle1.perimeter

computeArea(circle1)
circle1.area

printCircleEquation(2, 3, circle1)
#%%
using Pkg
Pkg.activate("TestPackage1")

#%%
using TestPackage1

TestPackage1.greet()

module TestPackage1
using SpecialFunctions

export mySpecialFunction

greet() = print("Hello World!")

function mySpecialFunction(x)
    return x^2 * gamma(x)
end

end

using Pkg
Pkg.activate("TestPackage1")

TestPackage1.mySpecialFunction(42)
#%%
using Pkg
Pkg.add("Plots")
using Plots

x = 1:0.01:10*pi
y = sin.(x)
y2 = sin.(x).^2

plot(x,y, label="sin(x)")
plot!(xlab="x", ylab="f(x)")
plot!(x, y2, label="sin(x)^2", color=:red, line=:dash)
#%%
plotly()
x=1:0.1:3*π
y=1:0.1:3*π

xx = reshape([xi for xi in x for yj in y],  length(y), length(x))
yy = reshape([yj for xi in x for yj in y],  length(y), length(x))
zz = sin.(xx).*cos.(yy)
plot3d(xx,yy,zz, label=:none, st = :surface)
plot!(xlab="x", ylab="y", zlab="sin(x)*cos(y)")
savefig("img2")
#<iframe width="100%" height="450px" frameborder="0" scrolling="no" src="/img2.html"></iframe>

Pkg.add("ORCA")
using ORCA

savefig("img2.png")