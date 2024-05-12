#função que utiliza do método para avaliar p(x_0) e p'(x_0)

function horner(p::Vector, x_0::Float64)

    n = length(p)-1

    if n == 0
        return(p[1], 0.0)

    end

    if n == 1
        return (p[1] + (p[2] * x_0), x_0)

    end

    a = p[n+1]
    b = p[n+1]

    for j = n:2

        a = p[j] + x_0*a
        b = a + x_0*b

    end

    a = p[1] + x_0 * a

    return[a,b]
    
end

#método de newton mas com o uso da função acima

function hnewton(p::Vector, x_0::Float64, T::Float64, N::Int64)

    if length(p) == 1

        if p[1] == 0.0

            return("Todo número real é raíz de p")

        else

            return("p não possui raízes")

        end

    end

    if length(p) == 2

        if p[2] != 0.0

            return(-p[1]/p[2])

        elseif p[1] == 0.0

            return("Todo número real é raíz de p")

        else

            return("p não possui raízes")

        end

    end

    x_i = x_0
    q = x_0
 
    for i = 1:N
        
        w = horner(p,x_i)

        if w[2] == 0

            if w[1] == 0

                return(x_i)

            else

                return ("Método falhou em ", i)

            end

        end
 
        q = x_i - w[1] / w[2]

        if abs(q - x_i) < T

            return (q)

        end

        x_i = q
 
    end
 
    return ("Deu ruim")

end