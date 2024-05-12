function stef(f::Function, x::Float64, T::Float64, n::Int64)

x0 = x
h(x) = f(x) + x

    for i = 1:n

        x1 = h(x0)
        x2 = h(x1)
        x_i = x0 - ((x1 - x0)^2)/(x2-2*x1+x0)

        if abs(x_i - x0) < T
            return(x_i)
        
        end

        x0 = x_i

    end

    return("Deu ruim")

end