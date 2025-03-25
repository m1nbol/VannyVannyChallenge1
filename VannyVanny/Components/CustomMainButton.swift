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
                RoundedRectangle(cornerRadius: 20)
                    .fill(buttonStyle.returnColor())
                    .shadow(color: .black.opacity(0.15), radius: 5, x: 0, y: 0)
                    .frame(minWidth: width, maxHeight: height)
                
                Text(buttonStyle.returnText())
                    .font(.pretend(type: .semibold, size: 23))
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
    
    func returnColor() -> Color {
        switch self {
        case .ok, .next:
            return .main
        case .cancel, .before:
            return .cancel
        }
    }
    
    func returnText() -> String {
        switch self {
        case .ok:
            return "확인"
        case .cancel:
            return "취소"
        case .next:
            return "다음"
        case .before:
            return "이전"
        }
    }
}

#Preview {
    CustomMainButton(buttonStyle: .next, action: {print("hello")}, width: 150, height: 60)
}
