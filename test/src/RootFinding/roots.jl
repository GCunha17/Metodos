#= @testset "Test roots" begin
    
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

end =#

#Teste antigo acima. Eduardo inventou mais umas funções a mais (funcionou)

@testset "Test Root Findind" begin
    
    tol = 1e-10
    N = 100
    τ = tol

    f(x) = cos(x)
    Df(x) = -sin(x)
    f0 = Float64(pi/2)
    g(x) = sin(x)
    Dg(x) = cos(x)
    g0 = Float64(pi)
    w(x) = (x^3)-1
    Dw(x) = 3*(x^2)
    w0 = 1.0
    y(x) = x^2
    Dy(x) = 2*x
    y0 = 0.0
    z(x) = log(x)
    Dz(x) = 1/x
    z0 = 1.0

# bissection

    x_calc = bisec(f,0.0,Float64(pi),τ,N)
    @test abs(f0-x_calc) ≈ 0 atol = tol

    x_calc = bisec(g,Float64(pi/2),Float64(3*pi/2),τ,N)
    @test abs(g0-x_calc) ≈ 0 atol = tol

    x_calc = bisec(w,0.0,2.0,τ,N)
    @test abs(w0-x_calc) ≈ 0 atol = tol

    x_calc = bisec(y,-1.0,1.0,τ,N)
    @test abs(y0-x_calc) ≈ 0 atol = tol

    x_calc = bisec(z,0.1,2.0,τ,N)
    @test abs(z0-x_calc) ≈ 0 atol = tol

# Fixed Point (só funciona com funções que são contrações, logo apenas com f e g)

    x_calc = fixp(f,1.0,τ,N)
    @test abs(f0-x_calc) ≈ 0 atol = tol

    x_calc = fixp(g,2.5,τ,N)
    @test abs(g0-x_calc) ≈ 0 atol = tol

    #x_calc = fixed_point(w,0.7,τ,N)
    #@test abs(w0-x_calc, ) ≈ 0 atol = tol

    #x_calc = fixed_point(y,0.2,τ,N)
    #@test abs(y0-x_calc, ) ≈ 0 atol = tol

    #x_calc = fixed_point(z,0.7,τ,N)
    #@test abs(z0-x_calc, ) ≈ 0 atol = tol

# Newton

    x_calc = newton(f,Df,1.0,τ,N)
    @test abs(f0-x_calc) ≈ 0 atol = tol

    x_calc = newton(g,Dg,2.5,τ,N)
    @test abs(g0-x_calc) ≈ 0 atol = tol

    x_calc = newton(w,Dw,0.7,τ,N)
    @test abs(w0-x_calc) ≈ 0 atol = tol

    x_calc = newton(y,Dy,0.2,τ,N)
    @test abs(y0-x_calc) ≈ 0 atol = tol

    x_calc = newton(z,Dz,0.7,τ,N)
    @test abs(z0-x_calc) ≈ 0 atol = tol

# Secant

    x_calc = secant(f,0.0,1.0,τ,N)
    @test abs(f0-x_calc) ≈ 0 atol = tol

    x_calc = secant(g,3.0,3.5,τ,N)
    @test abs(g0-x_calc) ≈ 0 atol = tol

    x_calc = secant(w,0.0,2.0,τ,N)
    @test abs(w0-x_calc) ≈ 0 atol = tol

    x_calc = secant(y,-0.5,0.2,τ,N)
    @test abs(y0-x_calc) ≈ 0 atol = tol

    x_calc = secant(z,0.1,2.0,τ,N)
    @test abs(z0-x_calc) ≈ 0 atol = tol

end