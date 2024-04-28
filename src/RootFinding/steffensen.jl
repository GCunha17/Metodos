function stef(f::Function, x::Float64, n::Int64)

    g(x) = (f(x+f(x)))/f(x) - 1
    
    f_1 = f(x)

    for i = 2:n

        if f(x) == x
            return(x)

        end

        f_i = f_1 - (f(f_1))/(g(f_1))
        f_1 = f_i

        if i == n
            return(f_1)

        end

    end

    return("Deu ruim")

end