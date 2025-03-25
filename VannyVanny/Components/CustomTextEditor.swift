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
    let strokeColor: Color
    let backgroundColor: Color
    
    init(
        text: Binding<String>,
        placeholder: String,
        maxtextCount: Int,
        strokeColor: Color,
        backgroundColor: Color
    ) {
        self._text = text
        self.placeholder = placeholder
        self.maxTextCount = maxtextCount
        self.strokeColor = strokeColor
        self.backgroundColor = backgroundColor
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
                        .font(.pretend(type: .medium, size: 12))
                        .foregroundStyle(Color.gray01)
                }
            })
            .textInputAutocapitalization(.none)
            .background(backgroundColor)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .font(.pretend(type: .medium, size: 14))
            .scrollContentBackground(.hidden)
            .overlay(alignment: .bottomTrailing, content: {
                Text("\(text.count) / \(maxTextCount)")
                    .font(.pretend(type: .medium, size: 12))
                    .foregroundStyle(Color.black)
                    .padding(.trailing, 15)
                    .padding(.bottom, 15)
                    .onChange(of: text) { newValue, oldValue in
                        if newValue.count > maxTextCount {
                            text = String(newValue.prefix(maxTextCount))
                        }
                    }
            })
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(strokeColor, lineWidth: 1)
                    .fill(Color.clear)
            )
        
    }
}

extension TextEditor {
    func customStyleEditor(text: Binding<String>, placeholder: String, maxTextCount: Int, border: Color, backColor: Color) -> some View {
        self.modifier(CustomTextEditor(text: text, placeholder: placeholder, maxtextCount: maxTextCount, strokeColor: border, backgroundColor: backColor))
    }
}

struct CustomTextEditor_Preview: PreviewProvider {
    @State static var inputText = ""
    
    static var previews: some View {
        TextEditor(text: $inputText)
            .customStyleEditor(text: $inputText, placeholder: "고민을 적으세요", maxTextCount: 150, border: Color.gray, backColor: Color.white)
            .frame(width: 347, height: 204)
            .previewLayout(.sizeThatFits)
    }
}
