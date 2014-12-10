struct Rank {
    var rank: String
    init (rank: String){
        self.rank = rank
    }
    func simpleDescription() -> String {
        return rank
    }
}

struct Suit {
    var suit: String
    init (suit: String){
        self.suit = suit
    }
    func simpleDescription() -> String {
        return suit
    }
}

struct Card {
    var rank: Rank
    var suit: Suit
    init (rank: String, suit: String) {
        self.rank = Rank(rank: rank)
        self.suit = Suit(suit: suit)
    }
    func simpleDescription() -> String {
        return "The card is a \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

// Add a method to Card that creates a full deck of
// cards, with one card of each combination of rank
// and suit
// Editors note: We will create a new Deck struct to hold this method instead of adding it to Card.

struct Deck {
    var cards = [Card]()
    let suits = ["Hearts", "Diamonds", "Spades", "Clubs"]
    let ranks = ["Ace", "Two", "Three", "Four", "Five", "Six", "Seven", "Eight", "Nine", "Ten", "Jack", "Queen", "King"]
    init () {
        cards = buildDeck()
    }
    func buildDeck() -> [Card] {
        var buildingDeck = [Card]()
        for suit in suits {
            for rank in ranks {
                var card = Card(rank: rank, suit: suit)
                buildingDeck.append(card)
            }
        }
        
        return buildingDeck
    }
}

var deck = Deck()

// Ace of Hearts
deck.cards[0].simpleDescription()

// King of Clubs
deck.cards[51].simpleDescription()


