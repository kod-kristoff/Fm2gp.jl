module Fm2gp

export is_odd, half, multiply1

function is_odd(x)::Bool
    x & 0x1
end

function half(x)
    x >> 1
end

function multiply1(n, a)
    if n == one(n)  return a
    end

    b = multiply1(half(n), a*a)
    if is_odd(n)    return b * a
    else            return b
    end
end

end # module
