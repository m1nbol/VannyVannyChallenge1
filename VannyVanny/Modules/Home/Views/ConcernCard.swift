//
//  ConcernCard.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

struct ConcernCard: View {
    
    var concern: Concern
    
    init(concern: Concern) {
        self.concern = concern
    }
    
    var body: some View {
        topIcon   
    }
    
    // MARK: - Icon
    
    private var topIcon: some View {
        ZStack(alignment: .bottom, content: {
            concernImage
            
            Text(concern.title)
                .font(.yoonChildfundkoreaDaeHan(type: .regular, size: 13))
                .foregroundStyle(Color.white)
                .lineLimit(nil)
                .lineSpacing(2.5)
                .frame(maxWidth: .infinity, maxHeight: 55)
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
        })
    }
    
    @ViewBuilder
    private var concernImage: some View {
        if let data = concern.imageData,
           let uiImage = UIImage(data: data) {
            Image(uiImage: uiImage)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, minHeight: 60)
        } else {
            Image(.treeOne)
                .resizable()
                .scaledToFit()
                .frame(maxWidth: .infinity, minHeight: 60)
        }
    }
}

#Preview {
    ConcernCard(concern: .init(title: "하하", imageData: .none))
}
