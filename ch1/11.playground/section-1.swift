class NamedShape {
    var numberOfSides: Int = 0
    var name: String
    init(name: String) {
        self.name = name
    }
}

// Make a subclass of NamedShape called Circle that takes a radius
// and a name as arguments to its initializer.  Implement an area
// and a describe method on the Circle class.

class Circle : NamedShape {
    var radius: Double
    init (radius: Double) {
        self.radius = radius
        super.init(name: "Circle")
    }
    func area() -> Double {
        return 2 * 3.14 * self.radius * self.radius
    }
    func describe() -> String {
        return "I am a circle with an area of \(self.area())"
    }
}

var circle = Circle(radius: 5.4)
circle.area()
circle.describe()
