using LinearAlgebra

function inverse(A::Matrix{Float64})

    if size(A)[1] != size(A)[2]
        return("A matriz precisa ser quadrada.")

    end

    if det(A) == 0
        return("A matriz não possui inversa.")

    end

    n = size(A)[1]
    B = zeros(Float64,n,n)
    C = zeros(Float64,n,n)

    for i = 1:n

        C[i,i] += 1

    end

    for i = 1:n

        B[:,i] += solve_system_with_scaled_partial_pivoting(A,C[:,i])
        
    end

    return(B)
    
end