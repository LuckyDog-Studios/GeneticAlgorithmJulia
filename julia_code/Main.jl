# This is my main method
import Pkg
Pkg.add("Plots")
using Plots
# Import my code
include("src/Individual.jl")
include("src/Utils.jl")
include("src/HeapSort.jl")
include("src/GeneticAlg.jl")


const TARGET = "NOAH JANSSEN"
pop_size = 15000
selection_size = Int(pop_size/4)

# Creates a Vector of Individuals with size pop_size
population = [create_individual(TARGET) for _ in 1:pop_size]

apes = 0
generations = 0

# algorithm loop
while !has_perfect_fitness(population)
    global apes += pop_size
    elitist_selection!(population, selection_size)
    crossover!(population, TARGET)
    mutation!(population, 0.0001, TARGET)
    fill_population!(population, TARGET, pop_size)

    global generations += 1
end
println()
println("TARGET: ", TARGET)
println("GENERATIONS: ", generations)
println("POPULATION SIZE: ", pop_size)
println("APES: ", apes)

