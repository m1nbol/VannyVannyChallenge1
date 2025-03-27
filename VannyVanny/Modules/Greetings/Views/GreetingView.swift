//
//  GreetingView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/26/25.
//

import SwiftUI
import AVKit

struct GreetingView: View {
    
    @EnvironmentObject var appFlowViewModel: AppFlowViewModel
    @State var player: AVPlayer?
    
    var viewModel: GreetingViewModel = .init()
    
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .bottom, content: {
                if let player = player {
                    VideoPlayer(player: player)
                        .ignoresSafeArea()
                        .task {
                            player.play()
                            player.actionAtItemEnd = .none
                            NotificationCenter.default.addObserver(
                                forName: .AVPlayerItemDidPlayToEndTime,
                                object: player.currentItem,
                                queue: .main
                            ) { _ in
                                player.seek(to: .zero)
                                player.play()
                            }
                        }
                }
                
                greetingText
                    .safeAreaPadding()
            })
        }
        .task {
            if let url = Bundle.main.url(forResource: "gom", withExtension: "mov") {
                player = AVPlayer(url: url)
            } else {
                print("영상 파일 찾을 수 없습니다.")
            }
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
