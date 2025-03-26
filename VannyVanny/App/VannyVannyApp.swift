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
    @StateObject var appFlowViewModel: AppFlowViewModel = .init()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appFlowViewModel.appFlowState {
                case .greeting:
                    GreetingView()
                case .inputWorry:
                    Text("11")
                case .home:
                    HomeView()
                }
            }
            .environmentObject(appFlowViewModel)
            .environmentObject(container)
        }
        .modelContainer(for: [Concern.self, Cheer.self])
    }
}
