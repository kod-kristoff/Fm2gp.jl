module Fm2gp

export is_odd, half, multiply_recursive

function is_odd(x)::Bool
    x & 0x1
end

function half(x)
    x >> 1
end

function multiply_recursive(n, a)
    if n == one(n)  return a
    end

    result = multiply1(half(n), a*a)
    if is_odd(n)    result += a end
    result
end

end # module
