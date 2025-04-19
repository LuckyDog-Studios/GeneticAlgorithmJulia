# THIS WAS USED TO MAKE THE PLOTS
using Plots
# Import my code
include("src/Individual.jl")
include("src/Utils.jl")
include("src/HeapSort.jl")
include("src/GeneticAlg.jl")


const TARGET = "NOAH JANSSEN"
pop_size = 4000
selection_size = Int(pop_size/4)

population = [create_individual(TARGET) for _ in 1:pop_size]

apes = 0
generations = 0

x=Vector{Float64}(undef, 100) # mutation rate
y=Vector{Float64}(undef, 100) # generations

mutation_rate = collect(range(0.003, stop=0.00003, length=100))  # algorithm loop
for i in 1:100
    while !has_perfect_fitness(population)
        global apes += pop_size
        elitist_selection!(population, selection_size)
        crossover!(population, TARGET)
        mutation!(population, mutation_rate[i], TARGET)
        fill_population!(population, TARGET, pop_size)

        global generations += 1

    end
    y[i] = generations
    x[i] = mutation_rate[i]
    global generations = 0
    global apes = 0
    global population = [create_individual(TARGET) for _ in 1:pop_size]
    println(i)
end
plt = plot(
    x, y,
    xlabel = "Mutation Rate",
    ylabel = "Generations",
    title = "Generations vs Mutation Rate (pop_size=4000)",
    lw = 2,
    marker = :circle,
    label = "Mutation Rate"
)



savefig(plt, "mrvsgenerations_3.png")
