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
                
                ForEach (1..<51) { i in
                    let cardNum = Int.random(in: 1...50)
                ZStack{
                    
                        Rectangle()
                        .foregroundColor(Color(RandomColour.generate()))
                            .frame(width: geo.size.width-40, height: geo.size.height-100, alignment: .center)
                            .cornerRadius(20)
                            .shadow(color: RandomColour.colorView(), radius: 25)
                            
                        
                    Image(systemName: "\(cardNum).circle").resizable().aspectRatio(contentMode: .fit)
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
