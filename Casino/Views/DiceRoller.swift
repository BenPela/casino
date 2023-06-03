//
//  DiceRoller.swift
//  Casino
//
//  Created by Andrew on 2023-05-05.
//

import SwiftUI

struct DiceRoller: View {
    
    @State var numberOfDice = 5
    @State var d1 = Dice(d: 6, v: 6)
    @State var d2 = Dice(d: 6, v: 1)
    @State var total = 0
    
    var body: some View {
        
        VStack {
            Text("Dice Roller").font(.largeTitle).padding([.leading, .bottom, .trailing])
            Text("Total").font(.headline).padding(.bottom, 5.0)
            Text(String(total)).font(.largeTitle)
           
            HStack{
                Text("Number of Dice:")
                Button(
                    action:{
                        numberOfDice -= 1
                    },
                    label: {
                        Image(systemName: "minus.square.fill")
                    })
                Text(String(numberOfDice))
                Button(
                    action:{numberOfDice += 1},
                    label: {Image(systemName: "plus.square.fill")
                    })
            }.foregroundColor(.black)
            Picker("Number of Dice: ", selection: $numberOfDice){
                ForEach (0..<5) { index in
                    Text(String(index + 1)).tag(index + 1)
                }
            }.pickerStyle(WheelPickerStyle())
            LazyHStack{
                ForEach(0..<numberOfDice) {die in
                    Image("d6.\(Int.random(in: 1...6))")
                        .resizable()
                        .frame(width: 50, height: 50)
                        .aspectRatio(contentMode:.fit)
                }
            }.padding()
            Spacer()
            Button("Roll") {
                roll()
            }.padding().padding([.leading, .trailing], 40)
                .background(Color.red)
                .cornerRadius(50)
                .foregroundColor(Color.white)
                .font(.system(size: 18, weight: .bold, design: .default))
            Spacer()
            Button(
                action: {
                    reset()
                },
                label: {
                    Image(systemName: "gobackward")
                })
            
            
        }
        .padding()
    }
    
    
    func roll() {
        let d1v = Int.random(in: 1...6)
        d1 = Dice(d: 6, v: d1v)
        let d2v = Int.random(in: 1...6)
        d2 = Dice(d: 6, v: d2v)
        total += d1v + d2v
        
    }
    func reset() {
        d1 = Dice(d: 6, v: 6)
        d2 = Dice(d: 6, v: 6)
        total = 0
    }
    
    
}

struct DiceRoller_Previews: PreviewProvider {
    static var previews: some View {
        DiceRoller()
            .environmentObject(GameModel())
    }
}
