protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}

// Write an enumeration that conforms to this protocol

enum SampleEnum: ExampleProtocol {
    case Baseline, Adjusted
    
    var simpleDescription: String {
        get {
            switch self {
            case Baseline:
                return "Baseline description"
            case Adjusted:
                return "Adjusted description"
            }
        }
    }
    
    mutating func adjust() {
        self = SampleEnum.Adjusted
    }
    
}

var enumInstance = SampleEnum.Baseline
enumInstance.adjust()
enumInstance.simpleDescription
