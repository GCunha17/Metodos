@testset "Test CompositeSimpson solve_integral" begin

    tol = 1e-3

    #Problem 1
    
    f(x, p) = sin(x * p)
    p = 1.7
    a = -2.0
    b = 5.0
    domain = (a, b) # (lb, ub)
    prob = IntegralProblem(f, domain, p)
    sol = solve(prob, QuadGKJL())

    g(x) = sin(x * p)

    @test solve_integral(g, a, b, 1229) ≈ sol.u atol = tol

    @test solve_integral(g, b, a, 1229) ≈ - sol.u atol = tol

    @test solve_integral(g, a, a, 1) == 0

    #r = -0.21458017052625733

    #COLOCAR TESTS PARA POLINÔMIOS, LOG, E EXPONENCIAL

end