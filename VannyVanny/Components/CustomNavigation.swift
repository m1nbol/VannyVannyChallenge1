//
//  CustomNavigation.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

struct CustomNavigation: View {
    
    enum NaviType {
        case concernTree
        case cheerApple
    }
    
    let action: (() -> Void)
    let naviType: NaviType
    let rightAction: (() -> Void)?
    
    init(action: @escaping () -> Void, naviType: NaviType, rightAction: (() -> Void)? = nil) {
        self.action = action
        self.naviType = naviType
        self.rightAction = rightAction
    }
    
    var body: some View {
        switch naviType {
        case .concernTree:
            normalNavi
        case .cheerApple:
            cheerNavi
        }
    }
    
    private var normalNavi: some View {
        HStack(alignment: .center, spacing: 0, content: {
            
            Button(action: {
                action()
            }, label: {
                Image(.leftArrow)
            })
            
            Spacer().frame(maxWidth: 110)
            
            naviTitle
            
            Spacer()
        })
    }
    
    
    private var naviTitle: some View {
        Text("고민 나무")
            .font(.yoonChildfundkoreaDaeHan(type: .regular, size: 36))
            .foregroundStyle(Color.black)
    }
    
    private var cheerNavi: some View {
        HStack {
            Button(action: {
                action()
            }, label: {
                Image(.close)
                    .renderingMode(.template)
                    .foregroundStyle(Color.white)
            })
            
            Spacer()
            
            Button(action: {
                rightAction?()
            }, label: {
                Image(.cheerBtn)
            })
        }
    }
}
