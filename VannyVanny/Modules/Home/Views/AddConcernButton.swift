//
//  FloatingButtonView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/26/25.
//

import SwiftUI
import FloatingButton

struct AddConcernButton: View {
    
    @EnvironmentObject var container: DIContainer
    
    var body: some View {
        VStack {
            Spacer()
            
            addConcernBtn
        }
    }
    
    private var addConcernBtn: some View {
        Button(action: {
            withAnimation {
                container.navigationRouter.push(to: .createWorry)
            }
        }, label: {
            ZStack(content: {
                Image(.addConcern)
                    .fixedSize()
                
                Text("새로운 고민 심기")
                    .font(.yoonChildfundkoreaDaeHan(type: .regular, size: 28))
                    .foregroundStyle(Color.textBlack)
            })
        })
    }
}
