//
//  SettingsView.swift
//  Casino
//
//  Created by Andrew on 2023-05-10.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var gm: GameModel
    @State var selectedWP = "Wood"
    
    var body: some View {
        VStack{
            Text("Settings")
                .font(.largeTitle)
                
            Divider()
                .frame(width: 1.0, height: 1.0)
            HStack{
                if gm.background {
                    Text("Wallpaper: On")} else
                {Text("Wallpaper: Off")}
                Spacer()
                Text("Image: \(selectedWP)")}.font(.title2).multilineTextAlignment(.leading)
            
            
            Toggle(isOn: $gm.background, label: {Text("Background Image")})
            /*Toggle(isOn: $gm.background, label: {Text("Card Style List")})
            Toggle(isOn: $gm.background, label: {Text("Card Style List")})
            Toggle(isOn: $gm.background, label: {Text("Card Style List")})*/
            
            HStack{
                Text("Background Image")
                Spacer()
                Picker("Wallpaper Image", selection: $selectedWP){
                    Text("Green").tag("Green")
                    Text("Wood").tag("Wood")
                    Text("Cloth").tag("Cloth")
                }.pickerStyle(MenuPickerStyle())
            }
            Text("Background Image")
            HStack{
                Picker("Wallpaper Image", selection: $selectedWP){
                    Text("Green").tag("Green")
                    Text("Wood").tag("Wood")
                    Text("Cloth").tag("Cloth")
                }.pickerStyle(SegmentedPickerStyle())
            }
          
            Text("Background Image")
            HStack{
                Picker("Wallpaper Image", selection: $selectedWP){
                    Text("Green").tag("Green")
                    Text("Wood").tag("Wood")
                    Text("Cloth").tag("Cloth")
                }.pickerStyle(WheelPickerStyle())
            }
            Spacer()
        }.padding()
        
        
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(GameModel())
    }
}
