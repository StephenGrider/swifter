// Create a function that greets a person and announces the lunch special

func greet(name: String, lunchSpecial: String) -> (String) {
    return "Hello \(name).  Todays lunch special is \(lunchSpecial)"
}

greet("Bob", "hamburger")