enum Suit: Int, CaseIterable {
    case s = 0
    case h = 1
    case d = 2
    case c = 3
}

import Foundation

struct CardType: Identifiable, Equatable, Comparable {
    
    var id: String {
        return String(rank) + String(describing: suit)
    }
    var rank:Int
    var suit:Suit
    var imageName:String {
        String(rank) + "_of_" + String(describing: suit)}
    
    static var cardTypes: [CardType] {
        var cardTypes: [CardType] = []
        for suit in Suit.allCases {
            for rank in 2...14 {
                let card = CardType(rank: rank, suit: suit)
                cardTypes.append(card)
            }
        }
        return cardTypes
    }
    // compare cards
    static func < (lhs: CardType, rhs: CardType) -> Bool {
        //        print("left Card" + lhs.imageName)
        //        print("right Card" + rhs.imageName)
        //        print("is tie?" + String(lhs == rhs))
        //        print("player win?" + String(lhs.rank<rhs.rank))
        //        print("cpu win?" + String(lhs.rank>rhs.rank))
        if lhs.rank == rhs.rank {
            return lhs.suit.rawValue < rhs.suit.rawValue
        } else {
            print(lhs.rank < rhs.rank)
            return lhs.rank < rhs.rank
        }
    }
}
