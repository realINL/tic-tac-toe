//
//  GameManager.swift
//  tictac
//
//  Created by Ilia on 09.10.2024.
//

import Foundation
class GameManager: ObservableObject {
    @Published var showGame: Bool = false
    @Published var boardSize: Int = 3
}
