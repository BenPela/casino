//
//  GameListView.swift
//  Casino
//
//  Created by Andrew on 2023-05-11.
//

import SwiftUI

struct GameListView: View {
    @EnvironmentObject var gm: GameModel
    var body: some View {
        NavigationView {
            List(0..<gm.gameNames.count, id: \.self) { n in
            
                NavigationLink(destination: gm.gameList[n],
                                           label: {
                    Text(gm.gameNames[n])
                            })
                        }
            .navigationTitle("All Games") 
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
            .environmentObject(GameModel())
    }
}
