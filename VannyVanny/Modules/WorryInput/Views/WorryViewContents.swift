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
            return "aslkdhaslsdlhasjkashjkdashjdhasdasjkdashdksahdkjashdkashdjakshdjkasdhjkasdhkasjhdaskjdhkasjdh"
        case .second:
            return "aslkdhaslsdlhasjkashjkdashjdhasdasjkdashdksahdkjashdkashdjakshdjkasdhjkasdhkasjhdaskjdhkasjdh"
        case .third:
            return "aslkdhaslsdlhasjkashjkdashjdhasdasjkdashdksahdkjashdkashdjakshdjkasdhjkasdhkasjhdaskjdhkasjdh"
        case .fourth:
            return "aslkdhaslsdlhasjkashjkdashjdhasdasjkdashdksahdkjashdkashdjakshdjkasdhjkasdhkasjhdaskjdhkasjdh"
        }
    }
}

#Preview {
    WorryViewContents(viewModel: .init())
}
