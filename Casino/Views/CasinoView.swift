//
//  ContentView.swift
//  Casino
//
//  Created by Andrew on 2023-04-27.
//

import SwiftUI

struct CasinoView: View {
    @EnvironmentObject var gm:GameModel
    var nArray = ["War","Slots","Dice War","Dice Roller"]
    var gArray:[AnyView] = [AnyView(WarView()),AnyView(SlotView()),AnyView(DiceView()),AnyView(DiceRoller())]
    
    var body: some View {
        let bg = gm.background
        GeometryReader {geo in
            if bg {
                Image("background-wood-grain")
                    .resizable()
                .ignoresSafeArea()}
            NavigationView {
                
                ScrollView {
                    VStack{
                        ForEach (0..<nArray.count, id: \.self) { n in
                            
                            NavigationLink(destination: gArray[n],
                                           label: {
                                VStack(spacing:0){
                                    Image("logo")
                                    Text(nArray[n])
                                    .foregroundColor(Color.white)}.padding().padding(.horizontal,50.0)
                                .background(Color.black.opacity(0.5))}).cornerRadius(20)
                        }
                        
                        //            List(0..<nArray.count, id: \.self) { n in
                        //
                        //                NavigationLink(destination: gArray[n],
                        //                               label: {
                        //                    Text(nArray[n])
                        //                })
                        //            }.navigationBarTitle("Games")
                        
                    }
                    
                    
                }
                
            }
        }
    }
}
struct CasinoView_Previews: PreviewProvider {
    static var previews: some View {
        CasinoView()
    }
}
