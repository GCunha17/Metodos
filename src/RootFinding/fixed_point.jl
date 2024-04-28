function fixp(f::Function,p_0::Float64,T::Float64,N::Int64)

    #Step 1
    h(x) = x + f(x)
    p = p_0
    p_i = p_0

    #Step 2
    for i=1:N

        #Step 3
        p = h(p_i)

        #Step 4
        if abs(p - p_i) < T
            return(p)

        end

        #Step 5
        p_i = p

    end

    #Step 6
    return("Deu ruim")

end

#Obs: função apenas para itrar f n vezes em delta_squared_aitken.jl