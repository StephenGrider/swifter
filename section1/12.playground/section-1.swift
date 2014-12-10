enum Rank: Int {    ￼case Ace = 1    case Two, Three, Four, Five, Six, Seven, Eight, Nine, Ten    case Jack, Queen, King    func simpleDescription() -> String {
        switch self {        case .Ace:            return "ace"        case .Jack:            return "jack"        case .Queen:            return "queen"        case .King:            return "king"        default:            return String(self.rawValue)        }    }}let acelet aceRawValue = ace.rawValue()

// Write a function that compares two rank values by comparing their raw values
func compare(firstRank: Rank, secondRank: Rank) -> Rank {
        if firstRank.rawValue() > secondRank.rawValue() {
            return firstRank
        } else {
            return secondRank
        }
}