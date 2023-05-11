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
            
            GameListView()
                .tabItem{
                    Image(systemName: "list.bullet")
                    Text("All Games")
                }.tag(0)
            CasinoView()
                .tabItem{
                    Image(systemName: "star.fill")
                    Text("Featured")
                }.tag(1)
            SettingsView()
                .tabItem{
                    Image(systemName: "globe")
                    Text("Settings")
                }.tag(2)
            
        }
    }
}

struct GameTabView_Previews: PreviewProvider {
    static var previews: some View {
        GameTabView()
            .environmentObject(GameModel())
    }
}
