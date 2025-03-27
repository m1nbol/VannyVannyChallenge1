//
//  NavigationRoutingView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

struct NavigationRoutingView: View {
    
    @State var destination: NavigationDestination
    
    @EnvironmentObject var container: DIContainer
    @EnvironmentObject var appFlowViewModel: AppFlowViewModel
    
    
    var body: some View {
        switch destination {
        case .cheerView(let concern):
            CheerView(concern: concern)
                .environmentObject(container)
        case .createWorry:
            WorryView(startPoint: .homeStart)
                .environmentObject(container)
                .environmentObject(appFlowViewModel)
        }
    }
}
