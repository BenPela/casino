//
//  SlotView.swift
//  Casino
//
//  Created by Andrew on 2023-04-27.
//

import SwiftUI

struct SlotView: View {
    @EnvironmentObject var gm: GameModel
    
    @State var score = 1000
    @State var lSlot = 3
    @State var cSlot = 3
    @State var rSlot = 3
    @State var GameOver = false
    
    
    var body: some View {
        let bg = gm.background
        
        ZStack {
            if (bg == true) { Image(gm.backgroundImage)
                    .resizable()
                .ignoresSafeArea(.all, edges: .top)}
            
            VStack {
                
                Text("SwiftUISlots").font(.largeTitle).padding([.leading, .bottom, .trailing])
                Spacer()
                //MARK: SCORE
                HStack{
                    Button(action: {reset()}, label: {Image(systemName: "gobackward")})
                    Text("Score :")
                    Text(String(score))
                }
                
                Spacer()
               //MARK: Rollers
                HStack {
                    if lSlot == 1 {Image("apple").resizable().aspectRatio(contentMode: .fit)}else if lSlot == 2{Image("cherry").resizable().aspectRatio(contentMode: .fit)}else {Image("star").resizable().aspectRatio(contentMode: .fit)}
                    if cSlot == 1 {Image("apple").resizable().aspectRatio(contentMode: .fit)}else if cSlot == 2{Image("cherry").resizable().aspectRatio(contentMode: .fit)}else {Image("star").resizable().aspectRatio(contentMode: .fit)}
                    if rSlot == 1 {Image("apple").resizable().aspectRatio(contentMode: .fit)}else if rSlot == 2{Image("cherry").resizable().aspectRatio(contentMode: .fit)}else {Image("star").resizable().aspectRatio(contentMode: .fit)}
                }.padding()
                Spacer()
                if GameOver == true {
                    Text("Game Over").font(.largeTitle)
                    Button {reset()
                        }
                    label: {Text("New Game")}
                    
                }else{
                    Button("Spin") {
                        spin()
                    }.padding().padding([.leading, .trailing], 40)
                            .background(Color.red)
                            .cornerRadius(50)
                            .foregroundColor(Color.white)
                            .font(.system(size: 18, weight: .bold, design: .default))
                    
                }
                    Spacer()
                }
            .padding()
            .foregroundColor(bg == true ? .white : .black)
        }
}
    
    
    func spin() {
        //Spin Slots
        let slot1V = Int.random(in: 1...3)
        lSlot = slot1V
        let slot2V = Int.random(in: 1...3)
        cSlot = slot2V
        let slot3V = Int.random(in: 1...3)
        rSlot = slot3V
        //Check Score
        if (lSlot == cSlot) && (cSlot == rSlot) {
            score += 100
        } else {score -= 25}
        //Check Game over
        if score <= 0 {GameOver = true}
    }
    func reset() {
        GameOver = false
        lSlot = 3
        cSlot = 3
        rSlot = 3
        score = 1000
    }
    
    
}



struct SlotView_Previews: PreviewProvider {
    static var previews: some View {
        SlotView()
            .environmentObject(GameModel())
    }
}
