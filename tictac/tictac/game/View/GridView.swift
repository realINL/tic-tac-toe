//
//  View.swift
//  tictac
//
//  Created by Ilia on 09.10.2024.
//

import SwiftUI

struct GridView: View {
    @StateObject var viewModel = GridViewModel()
    @EnvironmentObject var gameManager: GameManager
    let gridSize: Int = 3
    private var grid: [[String]] = []
    
    var body: some View {
        VStack {
            Text(viewModel.isXTurn && !viewModel.gameOver ? "Ход Х" : " ")
            
            if let winner = viewModel.winner {
                Text("\(winner) выиграл!")
                    .font(.largeTitle)
                    .padding()
            } else if viewModel.gameOver {
                Text("Ничья!")
                    .font(.largeTitle)
                    .padding()
            }
            
            Spacer()
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: viewModel.boardSize), spacing: 10) {
                ForEach(0..<viewModel.boardSize * viewModel.boardSize, id: \.self) { index in
                    ZStack {
                        Rectangle()
                            .fill(Color.blue)
                            .frame(width: 0.9 * (UIScreen.main.bounds.width / CGFloat(viewModel.boardSize)), height: (UIScreen.main.bounds.width / CGFloat(viewModel.boardSize)) * 0.9)
                            .cornerRadius(10)
                        
                        Text(viewModel.board[index])
                            .font(.system(size: (UIScreen.main.bounds.width / CGFloat(viewModel.boardSize)) * 0.7))
                            .foregroundColor(.white)
                    }
                    .onTapGesture {
                        viewModel.playerMove(at: index)
                    }
                }
            }
            .padding()
            
            Text(!viewModel.isXTurn && !viewModel.gameOver ? "Ход O" : " ")
            
            Spacer()
            
            Button("Новая игра") {
                viewModel.resetGame()
            }
            .padding()
            Button("Вернуться в меню") {
                gameManager.showGame.toggle()
            }
        }
        .onAppear(perform: {
            viewModel.boardSize = gameManager.boardSize
            viewModel.resetGame()
            
        })
    }
}

//#Preview {
//    GridView()
//}
