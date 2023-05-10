//
//  GameTabView.swift
//  Casino
//
//  Created by Andrew on 2023-05-09.
//

import SwiftUI

struct GameTabView: View {
    var body: some View {
        TabView{
            WarView()
                .tabItem{
                    Image(systemName: "cross.fill")
                    Text("War")
                }
            SlotView()
                .tabItem{
                    Image(systemName: "bitcoinsign.circle.fill")
                    Text("Slots")
                }
            DiceView()
                .tabItem{
                    Image(systemName: "die.face.6")
                    Text("Dice")
                }
            CasinoView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("All Games")
                }
        }
    }
}

struct GameTabView_Previews: PreviewProvider {
    static var previews: some View {
        GameTabView()
    }
}
