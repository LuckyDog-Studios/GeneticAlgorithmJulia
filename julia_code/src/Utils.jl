# prints out each member of the population (chromosome and fitness)
function print_population(population::Vector{Individual})
    for ind in population
        println(join(ind.chromosome), " ",string(ind.fitness))
    end
    println()
end