# This is my main method

# Import my code
include("src/Individual.jl")
include("src/Utils.jl")
include("src/HeapSort.jl")
include("src/GeneticAlg.jl")

const TARGET = "NOAH JANSSEN"
pop_size = 100

# Creates a Vector of Individuals with size pop_size
population = [create_individual(TARGET) for _ in 1:pop_size]



population = selection(population, 10, 3)
heapsort!(population)
print_population(population)
