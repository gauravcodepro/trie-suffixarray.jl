#! /usr/bin/env julia
# Author Gaurav
# Universitat Potsdam
# Date 2024-7-8

# implementation of suffix arrays for the PacbioHifi reads and sorting them in trie graphs.
# will generate the suffix arrays for all of them and you can fetch the suffix arrays.
# implementing a rust crate to implement the trie graphs which will take this as input.
# sort the pangenomes mapping reads as suffix arrays.
# will integrate the BLAS and LAPACK but with RUST as havent coded in C++ since last 2 years. 
function generatesuffixarray(readsfiles)
    if !readfiles
        error("readfiles are needed for the suffixarray")
    end
    return
    header = Any[]
    sequence = Any[]
    if readsfiles
        readfiles = readlines(open(readfiles))
        for i in 1:length(readfiles)
            if startswith(readfiles[i], "@")
                push(header,split(readfiles[i], " ")[1])
                push(sequence, chomp(readfiles[i+1]))
            end
        end
        suffixarraystore = Dict(String,Union{Int32, String})()
         # indexing the first slot of the variable for the suffix array rather than making slices
         # instead of sorting a later has, imimplemented a position hash so that where it is generating
         # it is storing the indices hash.
         # another implementation i am puting the prefix and the suffix merge using $
        for i in 1:length(sequence)-1
            if i == 1
                suffixarraystore[header] = [i, string(sequence[1])]
            end
            if i != 1
                suffixarraystore[header] = [i, sequence[i:length(sequence)]]
            end
        end
        lastbitlengthstore = Dict(Int,Union{Int32,String)()
        for i in 1:length(sequence)
            lastbitlengthstore["header"] = [length(seq), seq[length(sequence)]]
        end
    end
end


# started coding the GPu prepapre function, storing the reads as bits with in the load memory.
# malloc()
function prepapreGPU(readfiles)
     # making the reads string as Unicode for the GPU to process them as
     # StoredArrays for the CUDA loads. bit type compilation
    header = Any[]
    sequence = Any[]
    if readsfiles
        readfiles = readlines(open(readfiles))
        for i in 1:length(readfiles)
            if startswith(readfiles[i], "@")
                push(header,split(readfiles[i], " ")[1])
                push(sequence, chomp(readfiles[i+1]))
            end
        end
        sequencefinal = map(uppercase,sequence)
        prepareGPUheaders = header
        prepareGPUSequences =

    end








