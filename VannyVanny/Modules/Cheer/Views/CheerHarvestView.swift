//
//  CheerHarvest.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/26/25.
//

import SwiftUI

struct CheerHarvestView: View {
    
    let text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        Group {
            VStack(spacing: 10, content: {
                topLogo
                
                ZStack(content: {
                    Image(.cheerApple)
                    
                    ScrollView(.vertical, content: {
                        Text(text)
                            .font(.yoonChildfundkoreaDaeHan(type: .regular, size: 20))
                            .foregroundStyle(Color.black)
                            .lineLimit(nil)
                            .lineSpacing(2.5)
                            .multilineTextAlignment(.leading)
                            .safeAreaPadding()
                    })
                    .frame(width: 281, height: 230)
                })
            })
            .background(Image(.background))
        }
        .fixedSize()
    }
    
    private var topLogo: some View {
        ZStack(alignment: .top, content: {
            Image(.cheerLogo)
            
            Text("응원사과 수확!")
                .font(.yoonChildfundkoreaDaeHan(type: .regular, size: 36))
                .foregroundStyle(Color.black)
                .padding(.top, 30)
        })
        .padding(.top, 25)
    }
}

#Preview {
    CheerHarvestView(text: "국회의원이 회기전에 체포 또는 구금된 때에는 현행범인이 아닌 한 국회의 요구가 있으면 회기중 석방다. 모든 국민은 법률이 정하는 바에 의하여 국방의 의무를 진다.")
}
