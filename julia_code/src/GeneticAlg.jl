# Methods for use in the genetic algorithm

include("Individual.jl")
using Random

# using tournament selection
function selection(population::Vector{Individual}, amount::Int, tourney_size::Int)
    # Implement
    result = Vector{Individual}(undef, amount)
    for i in 1:amount
        shuffled_population = shuffle(population) # shuffles the order into a random order
        tournament = rand(population, tourney_size)
        result[i] = tournament[argmax([ind.fitness for ind in tournament])] # grabs the best individual in the tournament round
    end

    return result
end

function crossover()
    # Implement
end

function mutation()
    # Implement
end
