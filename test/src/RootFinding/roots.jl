@testset "Test roots" begin
    
    tol = 1e-10

    x = bisec(cos,1.0,3.0,1e-10,100)
    @test abs(π/2 - x) ≈ 0 atol = tol

    #x = fixp(cos,2.0,1e-10,100)
    #@test abs(π/2 - x) ≈ 0 atol = tol

    s(x) = -sin(x)
    x = newton(cos,s,2.0,1e-10,10)
    @test abs(π/2 - x) ≈ 0 atol = tol

    x = secant(cos,0.0,2.0,1e-10,10)
    @test abs(π/2 - x) ≈ 0 atol = tol

end