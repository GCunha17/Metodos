using Test
using LinearAlgebra: norm
using Integrals
DIGITS = 10

include("../src/Includes.jl")
#include("src/ErrorAnalysis/test_RoundOffErrors.jl")
#include("src/ErrorAnalysis/test_RoundArithmetics.jl")
include("src/LinearAlgebra/test_GaussianElimination.jl")
#include("src/RootFinding/roots.jl")
#include("src/Integrals/test_CompositeSimpson.jl")
include("src/LinearAlgebra/test_Pivoting.jl")
include("src/LinearAlgebra/test_Inverse.jl")

"""
Use this to test all!


for (root, dirs, files) in walkdir(joinpath(pwd(), "src"))
    for file in files
        include(joinpath(root, file))
    end
end
"""
