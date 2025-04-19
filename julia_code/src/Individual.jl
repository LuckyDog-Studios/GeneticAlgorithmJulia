ALPHABET = collect('A':'Z')  # Creates an array of characters from 'A' to 'Z'
ALPHABET = vcat(ALPHABET, ' ')  # Adds the space character to the array

# Individual object
mutable struct Individual
    chromosome::Vector{Char}
    fitness::Float64
end

# Encodes fitness levels for an Individual
function encode_fitness(ind::Individual, target::String)
    correct_letters = 0
    c = ind.chromosome
    target_length = length(target)  # Now directly using the input target length
    for i in 1:target_length
        if c[i] == target[i]
            correct_letters += 1
        end
    end
    # Return normalized fitness based on correct letters
    ind.fitness = correct_letters / target_length
end

# Creates an Individual
function create_individual(target::String)
    chromosome = randomize_chromosome(target)

    ind = Individual(chromosome, 0.0)
    encode_fitness(ind, target)
    return ind
end

# helper method - randomizes chromosome
function randomize_chromosome(target::String)
    chromosome_length = length(target)
    return [rand(ALPHABET) for _ in 1:chromosome_length]
end

# for the loop of the algorithm
function has_perfect_fitness(population::Vector{Individual})
    return any(ind -> ind.fitness == 1.0, population)
end

# for the loop of the algorithm
function current_max_fitness(population::Vector{Individual})
    return maximum(ind -> ind.fitness, population)
end