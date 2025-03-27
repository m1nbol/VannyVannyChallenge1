//
//  GreetingView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/26/25.
//

import SwiftUI

struct GreetingView: View {
    
    @EnvironmentObject var appFlowViewModel: AppFlowViewModel
    var viewModel: GreetingViewModel = .init()
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom, content: {
                Image(.onboardingBear)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: geo.size.width, height: geo.size.height)
                    .ignoresSafeArea(.all)
                
                greetingText
                    .safeAreaPadding()
            })
        }
    }
    
    private var greetingText: some View {
        VStack(alignment: .leading, spacing: 10, content: {
            ForEach(viewModel.displayedLines.indices, id: \.self) { index in
                let line = viewModel.displayedLines[index]
                Text(line)
                    .font(.pretend(type: .regular, size: 16))
                    .foregroundStyle(Color.black)
                    .lineLimit(nil)
                    .lineSpacing(2.5)
                    .multilineTextAlignment(.leading)
            }
        })
        .frame(maxWidth: .infinity, minHeight: 200, alignment: .topLeading)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 18)
                .fill(Color.white)
                .stroke(Color.gray01, style: .init(lineWidth: 1))
        }
        .task {
            startDialogue()
        }
    }
    
    private var lines: [String] {
        viewModel.fullText.components(separatedBy: .newlines).filter { !$0.isEmpty }
    }
    
    private func startDialogue() {
        viewModel.displayedLines = []
        viewModel.currentIndex = 0
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: true, block: { timer in
            if viewModel.currentIndex < lines.count {
                withAnimation {
                    viewModel.displayedLines.append(lines[viewModel.currentIndex])
                }
                viewModel.currentIndex += 1
            } else {
                timer.invalidate()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                    appFlowViewModel.appFlowState = .inputWorry
                })
            }
        })
    }
}

#Preview {
    GreetingView()
}
