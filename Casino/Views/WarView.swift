//
//  WarView.swift
//  Casino
//
//  Created by Andrew on 2023-04-27.
//

import SwiftUI

struct WarView: View {
    
    @State var pCard:CardType = CardType(rank: 0, suit: Suit.c)
    @State var cCard:CardType = CardType(rank: 0, suit: Suit.c)
    @State var GameOver = false
    @State var pScore = 0
    @State var cScore = 0
    @State var tie = 0
    @State var deckNum = 2
    @State var deck:[CardType] = []
    // NEW GAME
    func resetGame() {
        pScore = 0
        cScore = 0
        tie = 0
        pCard = CardType(rank: 0, suit: Suit.c)
        cCard = CardType(rank: 0, suit: Suit.c)
        GameOver = false
        deck = Array(repeating: CardType.cardTypes, count: deckNum).flatMap({$0})
    }
    //MARK: Card Table
    var body: some View {
        ZStack{
            Image("background-cloth")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Spacer()
                HStack{
                    Button {
                        resetGame()
                    }label: {
                        Image(systemName: "gobackward")
                    }
                    Spacer()
                    Button {
                        deckNum -= 1
                        resetGame()
                    } label: {
                        Image(systemName: "minus.square.fill")
                    }
                    Text("Decks: " + String(deckNum))
                    Button {
                        deckNum += 1
                        resetGame()
                    } label: {
                        Image(systemName: "plus.square.fill")
                    }
                    Spacer()
                    Button {
                        for _ in 1...deckNum{
                            for _ in 1...26 {
                                deal()
                                //Thread.sleep(forTimeInterval: 1)
                            }
                        }
                    }label: {
                        Image(systemName: "infinity.circle")
                    }
                   
                }.foregroundColor(.white).font(.headline)
                
                HStack{
                                    Button {
                                        resetGame()
                                    }label: {
                                        Image(systemName: "gobackward")
                                    }
                    Image("logo").resizable().aspectRatio(contentMode: .fit)
                    
                                    Button {
                                        for _ in 1...deckNum{
                                            for _ in 1...26 {
                                                deal()
                                            }
                                        }
                                    }label: {
                                        Image(systemName: "infinity.circle")
                                    }
                                }.foregroundColor(.white)
                    //.frame(width: 175, height: 175, alignment: .center)
                HStack(spacing:50) {
                    Image(pCard.imageName).resizable().aspectRatio(contentMode: .fit).frame(width: 175, height: 175, alignment: .trailing)
                    Image(cCard.imageName).resizable().aspectRatio(contentMode: .fit).frame(width: 175, height: 175, alignment: .leading)
                }
                
                .padding()
                Spacer()
                //MARK: Game over / Draw Button
                if GameOver == true && cScore > pScore {
                    Text("Game Over").font(.largeTitle).foregroundColor(.white)
                    Text("CPU Wins!").font(.largeTitle).foregroundColor(.white)
                }else if GameOver == true && pScore > cScore {
                    Text("Game Over!").font(.largeTitle).foregroundColor(.white)
                    Text("Player Wins!").font(.largeTitle).foregroundColor(.white)
                }else if GameOver == true && pScore == cScore {
                    Text("Game Over!").font(.largeTitle).foregroundColor(.white)
                    Text("ITS A TIE").font(.largeTitle).foregroundColor(.white)
                }
                else {
                    Button {
                        deal()
                    } label: {
                        Image("button")
                    }
                    
                }
                //Spacer()
                // New game / SIM button
//                HStack{
//                    Button {
//                        resetGame()
//                    }label: {
//                        Image(systemName: "gobackward")
//                    }
//
//                    Button {
//                        for _ in 1...multiDeck{
//                            for _ in 1...26 {
//                                deal()
//                                //Thread.sleep(forTimeInterval: 1)
//                            }
//                        }
//                    }label: {
//                        Image(systemName: "infinity.circle")
//                    }
//                }.foregroundColor(.white)
                
                Spacer()
                //MARK: Scoreboard
                HStack{
                    
                    Spacer()
                    
                    VStack{
                        Text("Player").font(.headline).padding(.bottom, 5.0)
                        Text(String (pScore)).font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("CPU").font(.headline).padding(.bottom, 5.0)
                        Text(String(cScore)).font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Cards").font(.headline).padding(.bottom, 5.0)
                        Text(String(deck.count)).font(.largeTitle)
                    }
                    
                    Spacer()
                    
                    VStack{
                        Text("Tie").font(.headline).padding(.bottom, 5.0)
                        Text(String(tie)).font(.largeTitle)
                    }
                    
                    Spacer()
                    
                }.foregroundColor(.white)
                
                Spacer()
                
            }
            //.padding(.bottom, 75.0)
            
            
        }.onAppear{resetGame()}
    
}
//MARK: Deal function
func deal (){
    // draw player card and remove from deck
    guard let randomC1:CardType = deck.randomElement() else {
        GameOver = true
        return
    }
    
    var index = deck.firstIndex(where: {$0 == randomC1})
    deck.remove(at: index!)
    // draw cpu card and remove from deck
    guard let randomC2:CardType = deck.randomElement() else {
        GameOver = true
        return
    }
    index = deck.firstIndex(where: {$0 == randomC2})
    deck.remove(at: index!)
    // compare cards and update score
    pCard = randomC1
    cCard = randomC2
//    print(pCard > cCard)
//    print(pCard < cCard)
//    print(pCard == cCard)
     if pCard > cCard {
     pScore += 1}
     else if cCard > pCard {
     cScore += 1}
     else {tie += 1}
// deck empty check
    if deck.count == 0 {
        GameOver = true
    }
}
}




struct WarView_Previews: PreviewProvider {
    static var previews: some View {
        WarView()
    }
}
