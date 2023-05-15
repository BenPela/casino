//
//  ContentView.swift
//  Casino
//
//  Created by Andrew on 2023-04-27.
//

import SwiftUI

struct CasinoView: View {
  @EnvironmentObject var gm: GameModel
    let textBackgroundRadius:CGFloat = 150
    var body: some View {
        
        ZStack {
            
            //           GeometryReader{ geo in
            //            if bg {
            //                Image("background-wood-grain")
            //                    .resizable()
            //                .ignoresSafeArea()}
            NavigationView {
                GeometryReader{ geo in
                ScrollView {
                    //Text(String(gm.background)).foregroundColor(.white)
                    LazyVStack{
                        
                        ForEach (0..<gm.gameNames.count, id: \.self) { n in
                            
                            NavigationLink(destination: gm.gameList[n],
                                           label: {
                                ZStack{
                                    
                                    Rectangle()
                                        .cornerRadius(50)
                                        .foregroundColor(RandomColour.colorView())
                                        .shadow(radius: 15)
                                    VStack{
                                        Image("\(gm.gameNames[n])")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: textBackgroundRadius, height: textBackgroundRadius, alignment: .center)
                                            .foregroundColor(.white)
                                            .padding(.top, 50.0)
                                        
                                        Text(gm.gameNames[n])
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
                }.background(backgroundStatus)}
            }
        }
        
    }
    
    var backgroundStatus: some View {
        if gm.background {
        return AnyView(Image("background-wood-grain"))
//                .resizable()
//                .aspectRatio(contentMode: .fill)
//                .ignoresSafeArea()
        }
        return AnyView(Color.black.ignoresSafeArea())
        
        
        
    }
}
    struct CasinoView_Previews: PreviewProvider {
        static var previews: some View {
            CasinoView()
                .environmentObject(GameModel())
        }
    }
