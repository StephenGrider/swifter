let numbers = [1, 2, 3]
numbers.map({ (number: Int) -> Int in
    let result = 3 * number
    return result
})

// Rewrite the closure to return zero for all odd numbers

numbers.map({ (number: Int) -> Int in
    if number % 2 != 0 {
        return 0
    } else {
        return number
    }
})
