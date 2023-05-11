//
//  SettingsView.swift
//  Casino
//
//  Created by Andrew on 2023-05-10.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var gm: GameModel
    var body: some View {
        VStack{
            Text("Settings")
            Toggle(isOn: $gm.background, label: {Text("Card Style List")})
            /*Toggle(isOn: $gm.background, label: {Text("Card Style List")})
            Toggle(isOn: $gm.background, label: {Text("Card Style List")})
            Toggle(isOn: $gm.background, label: {Text("Card Style List")})*/
            Spacer()
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(GameModel())
    }
}
