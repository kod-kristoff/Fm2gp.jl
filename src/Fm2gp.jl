module Fm2gp

export is_odd, half, multiply, multiply_accumulate, multiply_recursive, power_accumulate

function is_odd(x)::Bool
    x & 0x1
end

function half(x)
    x >> 1
end

function multiply_recursive(n, a)
    if n == one(n)  return a
    end

    result = multiply_recursive(half(n), a + a)
    if is_odd(n)    result += a end
    result
end

function multiply_accumulate(r, n::Integer, a)
    while true
        if is_odd(n)
            r = r + a
            if n == one(n)  return r    end
        end
        n = half(n)
        a = a + a
    end
end

function power_accumulate(r, n::Integer, a, op)
    while true
        if is_odd(n)
            r = op(r, a)
            if n == one(n)  return r    end
        end
        n = half(n)
        a = op(a, a)
    end
end

function multiply(n::Integer, a)
    while !is_odd(n)
        a = a + a
        n = half(n)
    end
    if n == one(n)  return a    end
    multiply_accumulate(a, half(n - 1), a + a)
end

end # module
