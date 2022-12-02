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
