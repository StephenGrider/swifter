enum Suit {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Clubs:
            return "clubs"
        case .Diamonds:
            return "diamonds"
        }
    }
}

let hearts = Suit.Hearts
let heartsDescription = hearts.simpleDescription()

// Add a color method to Suit that returns 'black' for spades and clubs, and 'red' for hearts and diamonds.

enum SuitWithColor {
    case Spades, Hearts, Diamonds, Clubs
    func simpleDescription() -> String {
        switch self {
        case .Spades:
            return "spades"
        case .Hearts:
            return "hearts"
        case .Clubs:
            return "clubs"
        case .Diamonds:
            return "diamonds"
        }
    }
    func suitColor() -> String {
        switch self {
        case .Spades, .Clubs:
            return "black"
        case .Hearts, .Diamonds:
            return "red"
        }
    }
}

let clubs = SuitWithColor.Clubs
let clubsColor = clubs.suitColor()