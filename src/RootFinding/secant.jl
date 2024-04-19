function secant(f::Function,p_0::Float64,p_1::Float64,T::Float64,N::Int64)

    #Step 1
    if f(p_0) == f(p_1)
        return("f(p_0) e f(p_1) estão muito próximos.")
    end

    #Step 2
    p = p_1
    p_i = p_1
    q_i = p_0
    f_pi = f(p_i)
    f_qi = f(q_i)

    #Step 3
    for i=1:N

        #Step 4
        if f_qi == f_pi
            return("f_qi e f_pi estao muito próximos")
        end

        #Step 5
        p = p_i - (f_pi * (p_i - q_i))/(f_pi - f_qi)

        #Step 6
        if abs(p_i - q_i) < T
            return(p)
        end

        #Step 7
        q_i = p_i
        p_i = p
        f_pi = f(p_i)
        f_qi = f(q_i)

    end

    #Step 8 (Não tinha esse na cópia, mas imaginei que seria necessário)
    return("Deu ruim")

end