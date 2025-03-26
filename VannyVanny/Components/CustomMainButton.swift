//
//  CustomMainButton.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

struct CustomMainButton: View {
    
    let buttonStyle: ButtonColor
    let action: () -> Void
    let width: CGFloat
    let height: CGFloat
    
    init(buttonStyle: ButtonColor, action: @escaping () -> Void, width: CGFloat, height: CGFloat) {
        self.buttonStyle = buttonStyle
        self.action = action
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Button(action: {
            withAnimation {
                action()
            }
        }, label: {
            ZStack {
                Image(buttonStyle.returnBackground())
                
                Text(buttonStyle.returnText())
                    .font(.yoonChildfundkoreaDaeHan(type: .regular, size: 28))
                    .foregroundStyle(Color.black)
            }
        })
        
    }
}

enum ButtonColor {
    case ok
    case cancel
    case next
    case before
    case plant
    
    func returnBackground() -> String {
        switch self {
        case .ok, .next, .plant:
            return "mainButton"
        case .cancel, .before:
            return "subButton"
        }
    }
    
    func returnText() -> String {
        switch self {
        case .ok:
            return "넘어가기"
        case .cancel:
            return "취소하기"
        case .next:
            return "다음으로"
        case .before:
            return "이전으로"
        case .plant:
            return "고민 심기"
        
        }
    }
}

#Preview {
    CustomMainButton(buttonStyle: .next, action: {print("hello")}, width: 150, height: 60)
}
