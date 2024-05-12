#OBS: Essa primeira tentativa que fiz não deu certo nos testes (por algum motivo). Reuni com o Eduardo e a Carol e saiu uma função que deu certo (graças a Deus)


"""
#Para esse método usaremos p_n := f_n, em que f_n(x) é f aplicada n vezes a um ponto x. Com isso, conseguiremos uma sequência que converge mais rápido
#para o ponto fixo de f, o que nos permite encontrar raízes de funções com menos iterações.

function d2a(f::Function, x::Float64, n::Int64)

    f_1 = f(x)
    f_2 = f(f_1)
    f_3 = f(f_2)

    for i=1:n

        if f_1 - 2*f_2 + f_3 > 1e-16
            g_i = f_1 - ((f_2 - f_1)^2)/( f_1 - 2*f_2 + f_3)
            f_1 = f_2
            f_2 = f_3
            f_3 = f(f_3)

        else
            return(f_3)

        end

        if i == n
            return(g_i)

        end

    end

    return("Deu ruim")

end

#Função para iterar a função n vezes num ponto x

function it_n(f::Function,x::Float64,N::Int64)

    x_0 = x

    for i=1:N

        x_i = f(x_0)
        x_0 = x_i

        if i == N
            return(x_i)
        end

    end

    return("Deu ruim")

end

function d2aroot(f::Function,p_0::Float64,T::Float64,N::Int64)

    h(x) = x + f(x)
    
    for i=1:N
    
        p_i = d2a(h,p_0,i)
        p_i2 = d2a(h,p_0,(i+1))
    
        if abs(p_i - p_i2) < T
                return(p_i2)

        end

        if p_i == p_i2
                return(p_i)
    
        end
    
    end
    
    return("Deu ruim")
    
end
"""

function d2a(f::Function,x_0::Float64,T::Float64,N::Int64)

    h(x) = f(x) + x
    ϵ = 1e-16

    for i = 1:N

        x_1 = h(x_0)
        x_2 = h(x_1)
        denom = (x_2 - x_1) - (x_1 - x_0)

        if abs(denom) < ϵ
            return("Denominador muito próximo de zero")

        end

        x_i = x_2 - ((x_2 - x_1)^2)/(denom)

        if abs(x_i - x_2) < T
            return x_i

        end

        x_0 = x_i

    end

    return("Deu ruim")

end