class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A simple description"
    }
}

// Add a constant property with let, and add another method that
// takes an argument.

class ShapePlus {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
    func setNumberOfSides(sides: Int) {
        self.numberOfSides = 3
    }
}

var shape = ShapePlus()
shape.setNumberOfSides(3)
shape.numberOfSides
