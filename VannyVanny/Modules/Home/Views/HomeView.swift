//
//  HomeView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI


struct HomeView: View {
    
    var viewModel: HomeViewModel = .init()
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        NavigationStack(path: $container.navigationRouter.destination, root: {
            ZStack(content: {
                ScrollView(.vertical, content: {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 13), count: 2), spacing: 13, content: {
                        if let concernData = viewModel.concernData {
                            ForEach(concernData, id: \.id, content: { concern in
                                ConcernCard(concern: concern)
                                    .onTapGesture {
                                        container.navigationRouter.push(to: .cheerView(concern: concern))
                                    }
                            })
                        }
                    })
                })
                .safeAreaPadding()
            })
            .background {
                Image(.background)
            }
            .navigationDestination(for: NavigationDestination.self, destination: { destination in
                NavigationRoutingView(destination: destination)
                    .environmentObject(container)
            })
        })
    }
}

#Preview {
    HomeView()
        .environmentObject(DIContainer())
}
