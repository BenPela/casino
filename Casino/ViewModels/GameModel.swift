//
//  GameModel.swift
//  Casino
//
//  Created by Andrew on 2023-05-05.
//
import SwiftUI
import Foundation

class GameModel:ObservableObject {
  //  @Published var games = [Game]()
    @Published var background = true
    @Published var backgroundImage = "Cloth"
    var gameNames = ["War","Slots","Dice War","Dice Roller","Card Flipper"]
    var gameList:[AnyView] = [AnyView(WarView()),AnyView(SlotView()),AnyView(DiceView()),AnyView(DiceRoller()),AnyView(CardFlipperView())]
}
