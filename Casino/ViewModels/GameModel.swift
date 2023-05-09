//
//  GameModel.swift
//  Casino
//
//  Created by Andrew on 2023-05-05.
//

import Foundation

class GameModel:ObservableObject {
   @Published var games = [Game]()
}
