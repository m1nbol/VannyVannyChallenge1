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
            lineText
            
            Spacer()
        })
        .background {
            Image(.background)
        }
        .safeAreaPadding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 20))
    }
    
    private var lineText: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            ForEach(splitText(viewModel.concern.title, maxLineLength: 25), id: \.self) { inline in
                Text(inline)
                    .font(.ownglyph(type: .regular, size: 20))
                    .multilineTextAlignment(.leading)
                    .padding(.vertical, 3)
            }
        })
        .padding(.top, 15)
        .border(Color.red)
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

#Preview {
    CheerView(concern: .init(title: "국회의원이 회기전에 체포 또는 구금된 떄에는 현행범인이 아닌 한 국회의 요구가 있으면 회기 중 석방다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다", imageData: nil))
}
