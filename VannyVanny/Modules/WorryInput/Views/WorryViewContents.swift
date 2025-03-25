//
//  WorryViewContents.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI
import Observation

struct WorryViewContents: View {
    
    @Bindable var viewModel: WorryViewModel
    
    var body: some View {
        switch viewModel.currentPage {
        case 0:
            makeView(question: .first)
        case 1:
            makeView(question: .second)
        case 2:
            makeView(question: .third)
        case 3:
            makeView(question: .fourth)
        default:
            EmptyView()
        }
    }
    
    private func makeView(question: Questions) -> some View {
        let binding = Binding<String>(
            get: {
                if viewModel.inputText.indices.contains(viewModel.currentPage) {
                    return viewModel.inputText[viewModel.currentPage]
                } else {
                    return ""
                }
            },
            set: { newValue in
                if viewModel.inputText.indices.contains(viewModel.currentPage) {
                    viewModel.inputText[viewModel.currentPage] = newValue
                }
            }
        )
        
        return VStack(alignment: .leading, spacing: 40) {
            Text(question.returnQuestion())
                .font(.pretend(type: .medium, size: 20))
                .foregroundStyle(Color.black)
                .lineLimit(nil)
                .lineSpacing(2.5)
            
            TextEditor(text: binding)
                .customStyleEditor(text: binding, placeholder: "위 질문에 대해 고민을 자유롭게 털어놔주세요!", maxTextCount: 150, border: Color.gray, backColor: Color.white)
                .frame(maxWidth: .infinity, maxHeight: 204)
        }
    }
}

enum Questions {
    case first
    case second
    case third
    case fourth
    
    func returnQuestion() -> String {
        switch self {
        case .first:
            return "요즘 신경 쓰이는 일이나 고민이 있다면, 편하게 나에게 얘기해줄 수 있을까?"
        case .second:
            return "이 고민 때문에 어떤게 제일 힘들었고, 어떤 감정이 들었어?"
        case .third:
            return "그렇구나, 앞으로는 어떻게 하고 싶어?"
        case .fourth:
            return "좋은 답변이야. 러너 얘기를 차근차근 들어보니, 러너는 앞으로 잘 헤쳐나갈 수 있을거라는 확신이 들어!"
        }
    }
}

#Preview {
    WorryViewContents(viewModel: .init())
}
