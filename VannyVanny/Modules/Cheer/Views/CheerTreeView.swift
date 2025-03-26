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
                            viewModel.newCheerText = cheer.message
                        }, label: {
                            Image(.apple)
                                .fixedSize()
                        })
                        .position(x: x, y: y)
                    } else {
                        Button(action: {
                            viewModel.shwoSheet.toggle()
                            viewModel.selectePositionIndex = index
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
            if let index = viewModel.selectePositionIndex {
                Text("응원 작성 위치: \(index)")
            }
        })
    }
}
