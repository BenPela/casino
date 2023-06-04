//
//  WarView.swift
//  Casino
//
//  Created by Andrew on 2023-04-27.
//

import SwiftUI

struct WarView: View {
    @EnvironmentObject var gm: GameModel
    
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
        deck = Array(repeating: CardType.cardTypes, count: deckNum)
            .flatMap({$0})
    }
    
    //MARK: Card Table
    
    var body: some View {
        let bg = gm.background
        GeometryReader{ geo in
            if bg{
                Image(gm.backgroundImage)
                    .resizable()
                .ignoresSafeArea(.all, edges: .top)}
            
            
            VStack (spacing:0) {
                //New Game, Deck Counter, Sim Game
                GeometryReader {geo in
                    HStack{
                        Button {
                            resetGame()
                        }label: {
                            Image(systemName: "gobackward")
                        }
                        
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
                        
                    }.foregroundColor(bg == true ? .white : .black).font(.headline).position(x:geo.frame(in: .local).midX)
                    //Logo
                    Image("War").resizable().aspectRatio(contentMode: .fit).frame(width: geo.size.width/1.3, height: geo.size.height/1.3).position(x:geo.frame(in: .global).midX, y:geo.frame(in: .local).midY)
                    
                }.padding(.bottom)
                //Cards
                HStack (alignment: .center) {
                    GeometryReader {geo in
                        Image(pCard.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width/1.2, height: geo.size.height/1.1)
                            .position(x:geo.frame(in: .local).midX, y:geo.frame(in: .local).midY)
                    }
                    
                    Spacer()
                    GeometryReader {geo in
                        Image(cCard.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width/1.2, height: geo.size.height/1.1)
                            .position(x:geo.frame(in: .local).midX, y:geo.frame(in: .local).midY)
                    }
                }.padding(.bottom)
                
                GeometryReader {geo in
                    VStack{
                        //MARK: Game over / Draw Button
                        if GameOver == true && cScore > pScore {
                            Text("Game Over: CPU Wins!").font(.largeTitle).foregroundColor(.white).padding(.bottom)
                            //Text("CPU Wins!").font(.largeTitle).foregroundColor(.white).padding(.top)
                                .background(Color.red)
                                .frame(width: 0.0, height: 0.0)
                                .cornerRadius(50)
                            
                            
                            
                        }
                        else if GameOver == true && pScore > cScore {
                            Text("Game Over: Player Wins!").font(.largeTitle).foregroundColor(.white)
                            //Text("Player Wins!").font(.largeTitle).foregroundColor(.white).padding(.bottom)
                        }else if GameOver == true && pScore == cScore {
                            Text("Game Over: Tie!").font(.largeTitle).foregroundColor(.white)
                            //Text("ITS A TIE").font(.largeTitle).foregroundColor(.white)
                        }
                        else {
                            Button {
                                deal()
                            } label: {
                                Image("button")
                            }
                            
                        }
                        
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
                            
                        }.foregroundColor(bg == true ? .white : .black).padding(.vertical)
                        
                    }.position(x:geo.frame(in: .local).midX, y:geo.frame(in: .local).midY)
                }
            }
            
            
            
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
            .environmentObject(GameModel())
    }
}
