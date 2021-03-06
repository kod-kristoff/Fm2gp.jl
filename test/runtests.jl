 using Fm2gp, Test

@testset "is_odd" begin
    @test is_odd(2) == false
    @test is_odd(3) == true
end

@testset "half" begin
    @test half(4) == 2
    @test half(7) == 3
end

@testset "multiply_recursive" begin
    n, x = 1, 2
    r = multiply_recursive(n, x)
    @test r == x
    @test typeof(r) == typeof(x)

    n, x = 3, 4.0
    r = multiply_recursive(n, x)
    @test r == 12.0
    @test typeof(r) == typeof(x)
end

@testset "multiply" begin
    n, x = 1, 2
    r = multiply(n, x)
    @test r == x
    @test typeof(r) == typeof(x)

    n, x = 3, 4.0
    r = multiply(n, x)
    @test r == 12.0
    @test typeof(r) == typeof(x)
end

@testset "power_accumulate_mul" begin
    n, x = 1, 2
    r = power_accumulate(1, n, x, *)
    @test r == x
    @test typeof(r) == typeof(x)

    n, x = 3, 4.0
    r = power_accumulate(1.0,n, x, *)
    @test r == 64.0
    @test typeof(r) == typeof(x)
end
