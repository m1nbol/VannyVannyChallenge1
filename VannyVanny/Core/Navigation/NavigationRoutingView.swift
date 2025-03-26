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
    
    var body: some View {
        switch destination {
        case .cheerView(let concern):
            CheerView(concern: concern)
                .environmentObject(container)
        case .createWorry:
            Text("") //고민 생성 네비게이션
        case .createCheer:
            Text("") // 응원 생성 네비게이션
        }
    }
}
