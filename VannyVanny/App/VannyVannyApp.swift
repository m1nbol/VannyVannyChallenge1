//
//  VannyVannyApp.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

@main
struct VannyVannyApp: App {
    
    @State var inputText: String = ""
    @StateObject var container: DIContainer = .init()
    @StateObject var appFlowViewModel: AppFlowViewModel = .init()
    
    var body: some Scene {
        WindowGroup {
            Group {
                switch appFlowViewModel.appFlowState {
                case .greeting:
                    GreetingView()
                case .inputWorry:
                    WorryView(startPoint: .onboardStart)
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
