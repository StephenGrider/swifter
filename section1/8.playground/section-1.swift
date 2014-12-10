// Write a function that calculates the average of its arguments

func average(numbers: Int...) -> (Double) {
    var sum: Double = 0
    for number in numbers {
        sum += Double(number)
    }
    return sum / Double(numbers.count)
}

average(12, 14, 16)