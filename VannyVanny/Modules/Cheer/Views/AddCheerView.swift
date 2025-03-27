//
//  AddCheerView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/26/25.
//

import SwiftUI

struct AddCheerView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var text = ""
    
    var onSubmit: (String) -> Void
    
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Color.black.opacity(0.8)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea(.all)
            
            VStack {
                CustomNavigation(action: {
                    dismiss()
                }, naviType: .cheerApple, rightAction: {
                    if !text.trimmingCharacters(in: .whitespaces).isEmpty {
                        onSubmit(text)
                    }
                })
                .safeAreaPadding(.horizontal, 16)
                
                middleContents
            }
        })
        .task {
            UIApplication.shared.hideKeyboard()
        }
    }
    
    private var middleContents: some View {
        ZStack(content: {
            Image(.cheerApple)
            
            TextEditor(text: $text)
                .customCheerEditor(text: $text, placeholder: "응원의 말을 남겨주세요!", maxTextCount: 250, question: .first)
                .frame(width: 281, height: 230)
        })
    }
}
