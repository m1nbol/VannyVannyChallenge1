//
//  HomeView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI
import SwiftData


struct HomeView: View {
    
    var viewModel: HomeViewModel = .init()
    
    @Query var concernData: [Concern]
    @Environment(\.modelContext) private var context
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        NavigationStack(path: $container.navigationRouter.destination, root: {
            ZStack(content: {
                ScrollView(.vertical, content: {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 13), count: 2), spacing: 13, content: {
                        ForEach(concernData, id: \.id, content: { concern in
                            ConcernCard(concern: concern)
                                .onTapGesture {
                                    container.navigationRouter.push(to: .cheerView(concern: concern))
                                }
                        })
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
