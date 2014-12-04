var optionalName: String? = "John"
var greeting = "Hello!"
if let name = optionalName {
    greeting = "Hello, \(name)"
}

// Change optionalName to nil.  What greeting do you get?
// Add an else clause that sets a different greeting if 
// optionalName is nil.

optionalName = nil
if let name = optionalName {
    greeting = "Hello, \(name)"
} else {
    greeting = "Hello! What is your name?"
}

// Result is "Hello! What is your name?"