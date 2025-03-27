//
//  CheerView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

struct CheerView: View {
    
    @EnvironmentObject var container: DIContainer
    
    var viewModel: CheerViewModel
    
    init(concern: Concern) {
        self.viewModel = .init(concern: concern)
    }
    
    var body: some View {
        VStack(content: {
            
            CustomNavigation(action: {
                container.navigationRouter.pop()
            }, naviType: .concernTree)
            
            Spacer()
            
            lineText
            
            Spacer()
            
            CheerTreeView(viewModel: viewModel)
        })
        .background {
            Image(.background)
        }
        .safeAreaPadding(EdgeInsets(top: 0, leading: 16, bottom: 20, trailing: 16))
        .navigationBarBackButtonHidden()
    }
    
    private var lineText: some View {
        VStack(alignment: .leading, spacing: 14, content: {
            ForEach(splitText(viewModel.concern.title, maxLineLength: 25), id: \.self) { inline in
                Text(inline)
                    .font(.ownglyph(type: .regular, size: 20))
                    .multilineTextAlignment(.leading)
            }
        })
        .padding(.top, 22)
    }
    
    private func splitText(_ text: String, maxLineLength: Int) -> [String] {
        var line: [String] = []
        var currentLine = ""
        
        for word in text {
            currentLine.append(word)
            
            if currentLine.count >= maxLineLength {
                line.append(currentLine)
                currentLine = ""
            }
        }
        if !currentLine.isEmpty {
            line.append(currentLine)
        }
        
        return line
    }
}
