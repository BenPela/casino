//
//  CasinoApp.swift
//  Casino
//
//  Created by Andrew on 2023-04-27.
//

import SwiftUI

@main
struct CasinoApp: App {
    var body: some Scene {
        WindowGroup {
            GameTabView()
            .environmentObject(GameModel())
            
        }
    }
}
