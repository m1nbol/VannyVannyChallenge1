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
    
    var concernData: [Concern] = [.init(title: "국회의원이 회기전에 체포 또는 구금된 때에는 현행범인이", imageData: nil), .init(title: "으아아아아아아아아", imageData: nil), .init(title: "asdasdasdasad", imageData: nil), .init(title: "xcxl;ksdjfpowejfp", imageData: nil), .init(title: "rwgergdfbf", imageData: nil), .init(title: "axlmlksklmlsmclksmlkamdlk", imageData: nil), .init(title: "dccxcv", imageData: nil), .init(title: "asklaknclnlcknvk", imageData: nil), .init(title: "czxccz", imageData: nil), .init(title: "qwealknlkxclkvnxclvklsckvnsld", imageData: nil), .init(title: "zxccafgeggwr", imageData: nil)]
    @State var showFloating: Bool = false
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
                FloatingButtonView(isShowFloating: $showFloating)
                
                topTitle
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
}
