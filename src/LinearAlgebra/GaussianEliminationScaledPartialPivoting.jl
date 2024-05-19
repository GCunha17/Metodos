function solve_system_with_scaled_partial_pivoting(A::Matrix{Float64}, b::Vector{Float64})

    n = length(b)

    dimension_failure(A,n) && return

    Ab = [copy(A) copy(b)]

    for i=1:n-1

        s = zeros(Float64,n)
        Mi = zeros(Float64,n)

        for k=i:n

            s[k] += maximum(abs,Ab[k,:])

            if s == zeros(Float64,n)
                return("O sistema não admite solução única.")
            
            end

            Mi[k] += abs(Ab[k,i])/s[k]

        end

        M = maximum(abs,Mi)
        P = zeros(Int64,n-i+1)
        m = i

        for m = i:n

            if abs(Ab[m,i])/s[m] == M
                P[m-i+1] += M

            else
                P[m-i+1] += n

            end

        end

        p = minimum(P)

        if p != i
            N = copy(Ab[p,:])
            Ab[p,:] = Ab[i,:]
            Ab[i,:] = N

        end

        for j = i+1:n

            m_ji = Ab[j,i]/Ab[i,i]
            Ab[j,:] -= m_ji*Ab[i,:]
        
        end
    
    end

    if Ab[n,n] == 0
        return("O sistema não possui solução única.")

    end

    x = zeros(Float64,n)
    x[n] += Ab[n,n+1]/Ab[n,n]

    for i = n-1:-1:1

        S = 0

        for j = i+1:n
            S += Ab[i,j]*x[j]

        end

        x[i] += (Ab[i,n+1] - S)/Ab[i,i]

    end

    return(x)

end