function bisec(f::Function,a::Float64,b::Float64,T::Float64,N::Integer)
    #Step 1
    a_i = a
    b_i = b

    #Step 2
    for i = 1:N
        #Step 3
        p = a_i + (b_i - a_i)/2
        f_p = f(p)

        #Step 4
        if (f_p == 0) || ((b_i - a_i)/2 < T)
            return(p)
        end

        #Step 5
        if sign(f(a_i)) * sign(f(p)) > 0
            a_i = p
        else
            b_i = p
        end

    end

    #Step 6
    return("Deu ruim")

end