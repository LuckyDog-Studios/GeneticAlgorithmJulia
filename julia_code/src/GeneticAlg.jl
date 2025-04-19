# Methods for use in the genetic algorithm

include("Individual.jl")
include("HeapSort.jl")
include("Utils.jl")
using Random

# using tournament selection - inplace method that edits population that is input
function tournament_selection!(population::Vector{Individual}, amount::Int, tourney_size::Int)
    for i in 1:amount
        tournament = shuffle(population)[1:tourney_size]
        population[i] = tournament[argmax([ind.fitness for ind in tournament])] # grabs the best individual in the tournament round
    end
    resize!(population, amount) # resizes to only include fit individuals
end

# using elitist selection - inplace method that edits population
function elitist_selection!(population::Array{Individual, 1}, amount::Int)
    # sort the population
    heapsort!(population)
    
    # update population with the top individuals
    resize!(population, amount) 
end

# two point crossover method
function crossover!(population::Vector{Individual}, target::String)
    pop_size = length(population)
    for i in 1:Int(floor(pop_size/2)) # iterate from either side of the population array
        ind1 = population[i]
        ind2 = population[pop_size+1-i]

        gene1 = ind1.chromosome
        gene2 = ind2.chromosome
        
        # generate two random crossover points
        idx1, idx2 = sort(rand(1:length(gene1), 2))
        
        # do two-point crossover by swapping segments between idx1 and idx2
        gene1[idx1:idx2], gene2[idx1:idx2] = gene2[idx1:idx2], gene1[idx1:idx2]

        # Recalculate fitness of the individuals after crossover
        encode_fitness(ind1, target)
        encode_fitness(ind2, target)
    end
end

# mutation
function mutation!(population::Vector{Individual}, mutation_rate::Float64, target::String)
    for ind in population
        gene_is_edited = false # to avoid unnecessary fitness encoding
        for i in 1:length(ind.chromosome)
            if rand() < mutation_rate
                gene_is_edited = true
                old_char = ind.chromosome[i]
                new_char = rand(ALPHABET)
                while new_char == old_char # gauruntee a new gene
                    new_char = rand(ALPHABET)
                end
                ind.chromosome[i] = new_char
            end
        end
        if gene_is_edited 
            encode_fitness(ind, target) 
        end 
    end
end

#fill individuals after getting rid of unfit individuals
function fill_population!(population::Vector{Individual}, target::String, final_size::Int)
    while length(population) < final_size
        push!(population, create_individual(target))
    end
end

