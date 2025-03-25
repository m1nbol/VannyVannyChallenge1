//
//  NavigationRoutingView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

struct NavigationRoutingView: View {
    
    @State var destination: NavigationDestination
    
    var body: some View {
        switch destination {
        case .test:
            EmptyView()
        }
    }
}
