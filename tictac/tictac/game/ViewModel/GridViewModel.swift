//
//  GridViewModel.swift
//  tictac
//
//  Created by Ilia on 09.10.2024.
//

import Foundation
import SwiftUI

class GridViewModel: ObservableObject {
    @Published var boardSize: Int = 3
    @Published var board = Array(repeating: "", count: 9)
    @Published var isXTurn = true
    @Published var gameOver = false
    @Published var winner: String? = nil
    @Published var columns: [GridItem] = Array(repeating: GridItem(.flexible()), count: 3)
    
    
    func playerMove(at index: Int) {
        guard board[index] == "", winner == nil else { return }
        
        board[index] = isXTurn ? "X" : "O"
        
        if let win = checkWinner() {
            winner = win
            gameOver = true
        } else if !board.contains("") {
            gameOver = true
        }
        
        isXTurn.toggle()
    }
    
    func checkWinner() -> String? {
            let winPatterns = generateWinPatterns(for: boardSize)
            
            for combo in winPatterns {
                let first = board[combo[0]]
                if first != "", combo.allSatisfy({ board[$0] == first }) {
                    return first
                }
            }
            
            return nil
        }
    
    func generateWinPatterns(for size: Int) -> [[Int]] {
        var patterns = [[Int]]()
        
    
        for i in 0..<size {
            
            let row = (0..<size).map { i * size + $0 }
            patterns.append(row)
            
            
            let col = (0..<size).map { i + size * $0 }
            patterns.append(col)
        }
        
        
        let diag1 = (0..<size).map { $0 * (size + 1) }
        let diag2 = (0..<size).map { ($0 + 1) * (size - 1) }
        patterns.append(diag1)
        patterns.append(diag2)
        
        return patterns
    }



     func resetGame() {
            board = Array(repeating: "", count: boardSize * boardSize)
            isXTurn = true
            gameOver = false
            winner = nil
        }
}
