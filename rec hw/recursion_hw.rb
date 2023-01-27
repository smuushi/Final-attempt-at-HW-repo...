

def sum_to(n)
    return 1 if n == 1
    return nil if n < 1

    return n + sum_to(n - 1)
end


def add_numbers(nums_array)

    return nums_array[0] if nums_array.length == 1
    return nil if nums_array.length == 0

    return nums_array[0] + add_numbers(nums_array[1..-1])
end

def gamma_fnc(num)

    return 1 if num == 1
    return nil if num < 1

    return (num - 1) * gamma_fnc(num - 1)

end

def ice_cream_shop(flavors, favorite)

    return false if flavors.length == 0


    if flavors[0] == favorite
        return true
    else
        return ice_cream_shop(flavors[1..-1], favorite)
    end

end

def reverse(string)
    if string.length == 1
        return string
    end

    return string[-1] + reverse(string[0...-1])

end
