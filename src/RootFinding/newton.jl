function newton(f::Function,df::Function,p_0::Float64,T::Float64,N::Int64)

    #Step 1
    p = p_0
    p_i = p_0

    #Step 2
    for i=1:N

        #Step 3
        if df(p_i) == 0
            return("Derivada anulou")
        end

        #Step 4
        p = p_i - (f(p_i))/df(p_i)

        #Step 5
        if abs(p - p_i) < T
            return(p)
        end

        #Step 6
        p_i = p
    
    end
   
    #Step 7
    return("Deu ruim")

end