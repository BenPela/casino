//
//  ContentView.swift
//  Casino
//
//  Created by Andrew on 2023-04-27.
//

import SwiftUI

struct CasinoView: View {
    //@ObservedObject var array = GameModel()
    var nArray = ["War","Slots","Dice War","Dice Roller"]
    var gArray:[AnyView] = [AnyView(WarView()),AnyView(SlotView()),AnyView(DiceView()),AnyView(DiceRoller())]
    
    var body: some View {
        
        NavigationView {
            
            List(0..<nArray.count, id: \.self) { n in
                
                NavigationLink(destination: gArray[n],
                               label: {
                    Text(nArray[n])
                })
            }.navigationBarTitle("Games")
            
        }
        .ignoresSafeArea()
        .background(
            Image("background-wood-cartoon")
                .resizable()
                .scaledToFit())
        
    }
}
struct CasinoView_Previews: PreviewProvider {
    static var previews: some View {
        CasinoView()
    }
}
