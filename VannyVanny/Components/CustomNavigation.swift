//
//  CustomNavigation.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

struct CustomNavigation: View {
    
    let action: (() -> Void)?
    let title: String
    let leftNaviIcon: Image?
    
    init(action: (() -> Void)? = nil, title: String, leftNaviIcon: Image? = nil) {
        self.action = action
        self.title = title
        self.leftNaviIcon = leftNaviIcon
    }
    
    var body: some View {
        HStack(alignment: .center, content: {
            if leftNaviIcon != nil {
                if let action = action {
                    Button(action: {
                        action()
                    }, label: {
                        leftNaviIcon
                    })
                }
            }
            
            Spacer()
            
            naviTitle
            
            Spacer()
        })
    }
    
    @ViewBuilder
    private var naviTitle: some  View {
        Text(title)
            .font(.yoonChildfundkoreaDaeHan(type: .regular, size: 36))
            .foregroundStyle(Color.black)
    }
}

struct CustomNavigation_Preview: PreviewProvider {
    static var previews: some View {
        CustomNavigation(action: {}, title: "1/2", leftNaviIcon: Image(.leftChevron))
    }
}
