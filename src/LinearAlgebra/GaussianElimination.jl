"""
INPUT: Número de equações ou variáveis (n), a matriz A e o vetor coluna b, A' = [A, b].

OUTPUT: Solução x_1, x_2, ... , x_n =: x do sistema Ax = b
"""

function solve_system(matriz_A::Matrix{Float64}, matriz_b::Vector{Float64})
    n = length(b)

    dimension_failure(A,n) && return

    A = [copy(matriz_A) copy(matriz_b)]

    for i=1:n-1 #Step 1

        #Step 2 - Tome a_pi tal que a_pi != 0

        p = i
        fudeu = false

        for k = i:n
            if A[k,i] != 0
                p = k
                break
            end

            if k == n
                fudeu = true
            end
        end

        if fudeu
            println("Sistema não admite única solução")
            return
        end

        #Step 3 - se p != i, então E_p <-> E_i
        if p != i
            v = copy(A[p,:])
            A[p,:] = A[i,:]
            A[i,:] = v
        end

        #Step 4 - atualização das linhas
        for j = i+1:n
            m = A[j,i]/A[i,i] #Step 5

            #Step 6 - E_j - m E_i -> E_j

            A[j,:] = A[j,:] - m*A[i,:]

        end
    end

    #Step 7
    if A[n,n] == 0
        println("Sistema não admite única solução")
        return
    end

    #Step 8
    x = Vector{Float64}{undef, n}
    x[n] = A[n, n+1] / A[n, n]

end

function dimension_failure(A::Matrix{Float64}, number_of_variables::Int64)
    if number_of_variables != size(A)[1]
        println("O tamanho da matriz A e do vetor b são incompatíveis.")
        return true
    end

    if size(A)[2] != size(A)[1]
        println("A matriz A precisa ser quadrada.")
        return true
    end

    return false
end 