# THIS METHOD WAS IMPLEMENTED USING THE HeapSort.java


# import Individual code
include("Individual.jl")

function heapsort!(population::Vector{Individual})
    N = length(population)
    
    # Build the heap (heapify step)
    for k in floor(Int, N/2):-1:1
        downheap!(population, k, N)
    end

    # Perform the sorting
    for N in N:-1:2
        # Swap the first element with the last one
        population[1], population[N] = population[N], population[1]
        
        # Heapify the reduced heap
        downheap!(population, 1, N - 1)
    end
end

# Helper function to maintain the heap property by "sinking" an element
function downheap!(population::Vector{Individual}, k::Int, N::Int)
    T = population[k]
    
    while k <= floor(Int, N/2)
        j = 2 * k
        if j < N && population[j].fitness > population[j + 1].fitness
            j += 1
        end

        if T.fitness <= population[j].fitness
            break
        else
            population[k] = population[j]
            k = j
        end
    end
    population[k] = T
end