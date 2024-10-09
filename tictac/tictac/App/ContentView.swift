//
//  ContentView.swift
//  tictac
//
//  Created by Ilia on 09.10.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject var gameManager = GameManager()
    var body: some View {
        if gameManager.showGame {
            GridView()
                .environmentObject(gameManager)
        } else {
            GameSettingsView()
                .environmentObject(gameManager)
        }
    }
}
#Preview {
    ContentView()
}
