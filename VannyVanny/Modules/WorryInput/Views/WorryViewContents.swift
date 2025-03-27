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
    @EnvironmentObject var appFlowviewModel: AppFlowViewModel
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        switch viewModel.currentPage {
        case 0:
            makeView(question: .first)
        case 1:
            makeView(question: .second)
        case 2:
            makeView(question: .third)
        case 3:
            finalViewVstack()
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
        
        return VStack(alignment: .leading, spacing: 14) {
            makeText(question: question, alignment: .leading)
            makeTextEditor(binding: binding, question: question)
        }
        .padding(.top, 20)
    }
    
    private func finalViewVstack() -> some View {
        VStack(content: {
            HStack(content: {
                Spacer()
                
                Button(action: {
                    if viewModel.startPoint == .onboardStart {
                        self.appFlowviewModel.appFlowState = .home
                    } else if viewModel.startPoint == .homeStart {
                        container.navigationRouter.pop()
                    }
                }, label: {
                    Image(.close)
                })
            })
            
            makeText(question: .fourth, alignment: .center)
            
            Spacer()
            
            Image(.worryFinal)
            
            Spacer()
        })
        .safeAreaPadding(.horizontal, 16)
        
    }
    
    private func makeText(question: Questions, alignment: TextAlignment) -> some View {
        Text(question.returnQuestion())
            .font(.yoonChildfundkoreaDaeHan(type: .regular, size: 20))
            .foregroundStyle(Color.black)
            .lineLimit(nil)
            .lineSpacing(2.5)
            .multilineTextAlignment(alignment)
            .frame(alignment: .leading)
    }
    
    private func makeTextEditor(binding: Binding<String>, question: Questions) -> some View {
        TextEditor(text: binding)
            .customStyleEditor(text: binding, placeholder: "답변을 입력해줘", maxTextCount: 200, question: question)
            .frame(maxWidth: .infinity, maxHeight: 300)
            .previewLayout(.sizeThatFits)
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
            return "좋은 답변이야. \n러너 얘기를 차근차근 들어보니, 러너는 앞으로 잘 헤쳐나갈 수 있을거라는 확신이 들어! \n고민을 이야기해줘서 고마워!"
        }
    }
    
    func returnImage() -> Image {
        switch self {
        case .first:
            return .init(.worrySeedOne)
        case .second:
            return .init(.worrySeedTwo)
        case .third:
            return .init(.worrySeedThree)
        case .fourth:
            return .init(.worryFinal)
        }
    }
}
