//
//  FloatingButtonView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/26/25.
//

import SwiftUI
import FloatingButton

struct FloatingButtonView: View {
    
    @Binding var isShowFloating: Bool
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                floatingMainButton
            }
        }
        .padding(.bottom, 40)
        .safeAreaPadding(.trailing, 20)
    }
    
    private var floatingMainButton: some View {
        Button(action: {
            withAnimation {
                isShowFloating.toggle()
                container.navigationRouter.push(to: .createWorry)
            }
        }, label: {
            Image(systemName: "plus")
                .renderingMode(.template)
                .resizable()
                .foregroundStyle(Color.black)
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(20)
                .background {
                    Circle()
                        .fill(Color.floating)
                        .shadow(color: Color.black.opacity(0.15), radius: 5, x: 0, y: 4)
                    
                }
                .animation(.easeInOut(duration: 0.3), value: isShowFloating)
        })
    }
}

#Preview {
    FloatingButtonView(isShowFloating: .constant(false))
        .environmentObject(DIContainer())
}
