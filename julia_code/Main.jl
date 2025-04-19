# This is my main method

# Import my code
include("src/Individual.jl")
include("src/Utils.jl")
include("src/HeapSort.jl")
include("src/GeneticAlg.jl")

const TARGET = "NOAH JANSSEN"

#TWEAKABLE VALUES
pop_size = 4000 #Tweak
selection_size = Int(floor(pop_size/4)) #25% of pop_size
mutation_rate = 0.0001 #Tweak

# Creates a Vector of Individuals with size pop_size
population = [create_individual(TARGET) for _ in 1:pop_size]

apes = 0
generations = 0

# algorithm loop
while !has_perfect_fitness(population)
    global apes += pop_size
    elitist_selection!(population, selection_size) #select fittest individuals
    crossover!(population, TARGET) #crossover genomes
    mutation!(population, 0.mutation_rate, TARGET) #mutate genomes
    fill_population!(population, TARGET, pop_size) #resupply individuals
    global generations += 1

    println(current_max_fitness(population)," ", generations) # for debugging
end
println()
println("TARGET: ", TARGET)
println("GENERATIONS: ", generations)
println("POPULATION SIZE: ", pop_size)
println("APES: ", apes)

