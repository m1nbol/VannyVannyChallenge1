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
//            Group {
//                switch appFlowViewModel.appFlowState {
//                case .greeting:
//                    GreetingView()
//                case .inputWorry:
//                    Text("11")
//                case .home:
//                    HomeView()
//                }
//            }
//            .environmentObject(appFlowViewModel)
//            .environmentObject(container)
            
            TextEditor(text: $inputText)
                .customStyleEditor(text: $inputText, placeholder: "고민을 적으세요", maxTextCount: 150, question: .first)
                .frame(width: 347, height: 274)
                .previewLayout(.sizeThatFits)
        }
        .modelContainer(for: [Concern.self, Cheer.self])
    }
}
