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
            List(0..<gm.nArray.count, id: \.self) { n in
            
                NavigationLink(destination: gm.gArray[n],
                                           label: {
                    Text(gm.nArray[n])
                            })
                        }.navigationBarTitle("Games")
            
        }
    }
}

struct GameListView_Previews: PreviewProvider {
    static var previews: some View {
        GameListView()
            .environmentObject(GameModel())
    }
}
