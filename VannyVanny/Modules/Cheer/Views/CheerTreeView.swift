//
//  CheerTreeView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/26/25.
//

import SwiftUI
import SwiftData
import Observation

struct CheerTreeView: View {
    
    @Bindable var viewModel: CheerViewModel
    
    @State private var showingCheer: Bool = false
    @Environment(\.modelContext) private var context
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        GeometryReader { geo in
            ZStack {
                Image(.cheerTree)
                    .resizable()
                    .frame(width: geo.size.width)
                
                ForEach(0..<viewModel.maxPosition, id: \.self) { index in
                    let point = viewModel.positions[index]
                    let x = geo.size.width * point.x
                    let y = geo.size.height * point.y
                    
                    if viewModel.appleIndexes.prefix(viewModel.concern.cheers.count).contains(index) {
                        let cheerIndex = viewModel.appleIndexes.firstIndex(of: index)!
                        let cheer = viewModel.concern.cheers[cheerIndex]
                        
                        Button(action: {
                            print(cheer.message)
                            viewModel.newCheerText = cheer.message
                            viewModel.shwoSheet = true
                        }, label: {
                            Image(.apple)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 55, height: 55)
                        })
                        .position(x: x, y: y)
                    } else {
                        Button(action: {
                            viewModel.selectePositionIndex = index
                            if let index = viewModel.selectePositionIndex,
                               viewModel.concern.cheers.contains(where:  { $0.positionIndex == index }) {
                                viewModel.shwoSheet = true
                            } else {
                                viewModel.showAddCheerView = true
                            }
                        }, label: {
                            Image(.unCheer)
                                .fixedSize()
                        })
                        .position(x: x, y: y)
                    }
                }
            }
            .task {
                if viewModel.appleIndexes.isEmpty {
                    viewModel.appleIndexes = Array(0..<viewModel.maxPosition).shuffled()
                }
            }
        }
        .sheet(isPresented: $viewModel.shwoSheet, content: {
                CheerHarvestView(text: viewModel.newCheerText)
        })
        .fullScreenCover(isPresented: $viewModel.showAddCheerView) {
            AddCheerView(showAddCheerView: $viewModel.showAddCheerView) { newText in
                if let index = viewModel.selectePositionIndex {
                    let newCheer = Cheer(message: newText, positionIndex: index)
                    viewModel.concern.cheers.append(newCheer)
                    context.insert(newCheer)
                    try? context.save()
                    viewModel.showAddCheerView = false
                }
            }
        }
    }
}
