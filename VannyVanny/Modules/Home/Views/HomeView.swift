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
    @State var showFloating: Bool = false
    
    @Environment(\.modelContext) private var context
    
    @EnvironmentObject var container: DIContainer
    @EnvironmentObject var appFlowViewModel: AppFlowViewModel
    
    var body: some View {
        NavigationStack(path: $container.navigationRouter.destination, root: {
            ZStack(alignment: .top, content: {
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
                .safeAreaPadding(EdgeInsets(top: 90, leading: 16, bottom: 16, trailing: 20))
                
                AddConcernButton()
                
                topTitle
            })
            .background {
                Image(.background)
            }
            .navigationDestination(for: NavigationDestination.self, destination: { destination in
                NavigationRoutingView(destination: destination)
                    .environmentObject(container)
                    .environmentObject(appFlowViewModel)
            })
        })
    }
    
    private var topTitle: some View {
        ZStack(content: {
            Image(.homeTitle)
                .fixedSize()
            
            Text("고민 숲")
                .font(.yoonChildfundkoreaDaeHan(type: .regular, size: 36))
                .foregroundStyle(Color.black)
        })
    }
}

#Preview {
    HomeView()
        .environmentObject(DIContainer())
        .environmentObject(AppFlowViewModel())
}
