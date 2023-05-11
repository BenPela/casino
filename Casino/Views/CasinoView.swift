//
//  ContentView.swift
//  Casino
//
//  Created by Andrew on 2023-04-27.
//

import SwiftUI

struct CasinoView: View {
    @EnvironmentObject var gm: GameModel
    
    var body: some View {
        let bg = gm.background
        ZStack {
            
 //           GeometryReader{ geo in
//            if bg {
//                Image("background-wood-grain")
//                    .resizable()
//                .ignoresSafeArea()}
            NavigationView {
                
                ScrollView {
                    ForEach (0..<gm.nArray.count, id: \.self) { n in
                        
                        NavigationLink(destination: gm.gArray[n],
                                       label: {
                            ZStack{
                                
                                Rectangle()
                                    .cornerRadius(50)
                                    .foregroundColor(Color(RandomColour.generate()))
                                    .shadow(radius: 15)
                                VStack{
                                    Image("\(gm.nArray[n])")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 150, height: 150, alignment: .center)
                                        .foregroundColor(.white)
                                        .padding(.top, 50.0)
                                    
                                    
                                    
                                    
                                    Text(gm.nArray[n])
                                        .font(.title).foregroundColor(Color.white)
                                        .padding(.horizontal, 20.0).padding(.vertical, 10)
                                        .background(Color.black.opacity(0.6))
                                        .cornerRadius(10)
                                        .padding(.bottom, 50)
                                }
                                    
                                
                            }
                            .padding()

                            
                        })
                        
                    }
                    
                }
                .background(
                   
                    Image("background-wood-grain")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                        .ignoresSafeArea()
                    )
                
            }
        }
    }
}
struct CasinoView_Previews: PreviewProvider {
    static var previews: some View {
        CasinoView()
            .environmentObject(GameModel())
    }
}
