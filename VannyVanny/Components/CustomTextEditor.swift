//
//  CustomTextEditor.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

struct CustomTextEditor: ViewModifier {
    
    @Binding var text: String
    let placeholder: String
    let maxTextCount: Int
    let question: Questions
    
    init(
        text: Binding<String>,
        placeholder: String,
        maxtextCount: Int,
        question: Questions
    ) {
        self._text = text
        self.placeholder = placeholder
        self.maxTextCount = maxtextCount
        self.question = question
    }
    
    func body(content: Content) -> some View {
        content
            .padding(.vertical, 20)
            .padding(.horizontal, 17)
            .background(alignment: .topLeading, content: {
                if text.isEmpty {
                    Text(placeholder)
                        .lineSpacing(10)
                        .padding(.vertical, 25)
                        .padding(.horizontal, 17)
                        .font(.yoonChildfundkoreaDaeHan(type: .regular, size: 20))
                        .foregroundStyle(Color.gray01)
                }
            })
            .textInputAutocapitalization(.none)
            .background(Color.clear)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(.yoonChildfundkoreaDaeHan(type: .regular, size: 14))
            .scrollContentBackground(.hidden)
            .overlay(alignment: .bottomTrailing, content: {
                Text("\(text.count) / \(maxTextCount)")
                    .font(.yoonChildfundkoreaDaeHan(type: .regular, size: 20))
                    .foregroundStyle(Color.gray03)
                    .padding(.trailing, 15)
                    .padding(.bottom, 15)
                    .onChange(of: text) { newValue, oldValue in
                        if newValue.count > maxTextCount {
                            text = String(newValue.prefix(maxTextCount))
                        }
                    }
                    .allowsHitTesting(false)
            })
            .overlay(
                question.returnImage()
                    .resizable()
                    .allowsHitTesting(false)
            )
        
    }
}

extension TextEditor {
    func customStyleEditor(text: Binding<String>, placeholder: String, maxTextCount: Int, question: Questions) -> some View {
        self.modifier(CustomTextEditor(text: text, placeholder: placeholder, maxtextCount: maxTextCount, question: question))
    }
}

struct CustomTextEditor_Preview: PreviewProvider {
    @State static var inputText = ""
    
    static var previews: some View {
        TextEditor(text: $inputText)
            .customStyleEditor(text: $inputText, placeholder: "고민을 적으세요", maxTextCount: 150, question: .first)
            .frame(width: 347, height: 204)
            .previewLayout(.sizeThatFits)
    }
}
