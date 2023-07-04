//
//  Card_GameApp.swift
//  Card_Game
//
//  Created by Felipe Imbimbo on 24/06/2023.
//


import SwiftUI

@main
struct Card_GameApp: App {
    var body: some Scene {
        WindowGroup {
            MenuView()
            //MainView()
                .environmentObject(ContentModel())
        }
    }
}
