//
//  GameTabView.swift
//  Casino
//
//  Created by Andrew on 2023-05-09.
//

import SwiftUI

struct GameTabView: View {
    @EnvironmentObject var gm: GameModel
    @State var tabIndex = 3
    var body: some View {
        TabView(selection: $tabIndex){
            WarView()
                .tabItem{
                    Image(systemName: "cross.fill")
                    Text("War")
                }.tag(0)
            SlotView()
                .tabItem{
                    Image(systemName: "bitcoinsign.circle.fill")
                    Text("Slots")
                }.tag(1)
            DiceView()
                .tabItem{
                    Image(systemName: "die.face.6")
                    Text("Dice")
                }.tag(2)
            CasinoView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("All Games")
                }.tag(3)
            SettingsView()
                .tabItem{
                    Image(systemName: "globe")
                    Text("Settings")
                }.tag(4)
        }
    }
}

struct GameTabView_Previews: PreviewProvider {
    static var previews: some View {
        GameTabView()
            .environmentObject(GameModel())
    }
}
