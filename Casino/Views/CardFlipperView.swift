//
//  CardFlipperView.swift
//  Casino
//
//  Created by Andrew on 2023-05-11.
//

import SwiftUI

struct CardFlipperView: View {
    var body: some View {
        
        GeometryReader{geo in
            
            TabView{
                let card = Int.random(in: 1...50)
                ForEach (1..<51) { i in
                ZStack{
                    
                        Rectangle()
                        .foregroundColor(Color(RandomColour.generate()))
                            .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: (Color(red: Double.random(in: 0..<1), green: Double.random(in: 0..<1), blue: Double.random(in: 0..<1)).opacity(0.9)), radius: 15)
                            
                        
                        Image(systemName: "\(card).circle").resizable().aspectRatio(contentMode: .fit)
                            .frame(width: geo.size.width-80, height: geo.size.height-100, alignment: .center)
                    }
                }
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode:.always))
        }
    }}

struct CardFlipperView_Previews: PreviewProvider {
    static var previews: some View {
        CardFlipperView()
    }
}
