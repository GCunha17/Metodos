function solve_integral(f::Function, a::Float64, b::Float64, nintervalos::Int64)

    if a == b
        return 0
    end

    #Step 1
    h = (b-a)/(2*nintervalos)
    s1 = 0 # sum f(x_par)
    s2 = 0 # sum f(x_impar)

    #Step 2
    for i = 1: 2*nintervalos -1

        if i%2 == 0
            s1 += f(a + i*h)
        else
            s2 += f(a + i*h)
        end
    end

    #Step 3
    return ((h/3) * (f(a) + 2*s2 + 4*s1 + f(b)))

end