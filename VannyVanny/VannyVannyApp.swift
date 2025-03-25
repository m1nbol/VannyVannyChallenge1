//
//  VannyVannyApp.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

@main
struct VannyVannyApp: App {
    
    @StateObject var container: DIContainer = .init()
    
    var body: some Scene {
        WindowGroup {
            HomeView()
                .environmentObject(container)
        }
    }
}
