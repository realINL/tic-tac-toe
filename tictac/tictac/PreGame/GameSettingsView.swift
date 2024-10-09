//
//  GameSettingsView.swift
//  tictac
//
//  Created by Ilia on 09.10.2024.
//

import SwiftUI

struct GameSettingsView: View {
    @EnvironmentObject var gameManager: GameManager
    @State var boardSize = 0
    @State var showGame: Bool = false
    var body: some View {
        VStack{
            Spacer()
             
                Text("Размер поля: \(gameManager.boardSize)x\(gameManager.boardSize)")
                Slider(value: Binding(
                    get: { Double(gameManager.boardSize) },
                    set: { newValue in gameManager.boardSize = Int(newValue)
                    }
                ), in: 3...10, step: 1)
                .padding()
            
            Spacer()
            Button() {
                gameManager.showGame = true
            } label: {
                Text("Start")
                    .foregroundColor(.primary)
                    .font(.title)
                    .padding()
                    .background(Color(.blue))
                    .cornerRadius(15)
            }
            Spacer()
        }
    }
}

#Preview {
    GameSettingsView()
}
