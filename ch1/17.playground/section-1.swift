// Write an extension for the Double type that adds an absoluteValue property

extension Double {
    var absoluteValue: Double {
        get {
            if self < 0 {
                return self * -1
            } else {
                return self
            }
        }
    }
}

var negativeNumber: Double = -10.0
negativeNumber.absoluteValue

var positiveNumber: Double = 10.0
positiveNumber.absoluteValue

var zero: Double = 0.0
zero.absoluteValue
