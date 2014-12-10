protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// Write an enumeration that conforms to this protocol

enum Planets: ExampleProtocol {
    case Earth, Mars
    
    var simpleDescription: String {
        switch self {
        case .Earth:
            return "Blue and cloudy"
        case .Mars:
            return "Red and dusty"
        }
    }
    
    mutating func adjust() {
        switch self {
        case .Earth:
            self = .Mars
        case .Mars:
            self = .Earth
        }
    }
}

var planet = Planets.Mars
planet.simpleDescription
planet.adjust()
planet.simpleDescription


