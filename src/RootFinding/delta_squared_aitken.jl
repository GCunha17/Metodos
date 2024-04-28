#Para esse método usaremos p_n := f_n, em que f_n(x) é f aplicada n vezes a um ponto x. Com isso, conseguiremos uma sequência que converge mais rápido
#para o ponto fixo de f, o que nos permite encontrar raízes de funções com menos iterações.

function d2a(f::Function, x::Float64, n::Int64)

    f_1 = f(x)
    f_2 = f(f_1)
    f_3 = f(f_2)

    for i=1:n

        if f_1 - 2*f_2 + f_3 != 0
            g_i = f_1 - ((f_2 - f_1)^2)/( f_1 - 2*f_2 + f_3)
            f_1 = f_2
            f_2 = f_3
            f_3 = f(f_3)

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