//
//  WorryView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

struct WorryView: View {
    
    var viewModel: WorryViewModel
    
    @State var isAnimated: Bool = false
    @State private var isOverlayVisible: Bool = false
    
    
    init() {
        self.viewModel = .init()
    }
    
    var body: some View {
        VStack(content: {
            CustomNavigation(title: "\(viewModel.currentPage + 1) / 4", leftNaviIcon: Image(.leftChevron))
            
            Spacer().frame(height: 60)
            
            WorryViewContents(viewModel: viewModel)
                .frame(width: isAnimated ? 50 : 347, height: isAnimated ? 50 : 204)
                .overlay(isAnimated ? Color.blue : Color.clear)
                .cornerRadius(isAnimated ? 75 : 0)
                .rotationEffect(Angle(degrees: isAnimated ? 360 : 0))
                .animation(.easeInOut(duration: 0.5), value: isAnimated)
                .modifier(DelayedOffsetModifier(trigger: isAnimated))
            
            
            
            Spacer()
            
            HStack {
                if viewModel.currentPage >= 1 {
                    CustomMainButton(buttonStyle: .cancel, action: {
                        viewModel.currentPageDown()
                    }, width: 180, height: 60)
                }
                
                CustomMainButton(buttonStyle: viewModel.currentPage < 3 ? .next : .ok, action: {
                    isAnimated = true
                    
                    // 오버레이 표시
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        isAnimated = false
                        isOverlayVisible = true
                        
                        
                        // 오버레이 사라짐
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2.5) {
                            isOverlayVisible = false
                            viewModel.currentPageUP()
                        }
                    }
                }, width: 180, height: 60)
                
            }
        })
        .safeAreaPadding()
        .overlay(
            Group {
                if isOverlayVisible {
                    ZStack {
                        
                        // TODO: TEXT 추가?
                        
                        Image(viewModel.treeImage[viewModel.currentPage])
                            .resizable()
                            .scaledToFit()
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.gray01)
                }
            }
        )
        
        
        
    }
}

struct DelayedOffsetModifier: ViewModifier {
    let trigger: Bool
    @State private var shouldDrop = false
    
    func body(content: Content) -> some View {
        content
            .offset(y: shouldDrop ? 700 : 0) // 700
            .animation(.easeInOut(duration: 0.5), value: shouldDrop)
            .onChange(of: trigger) {
                if trigger {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                        shouldDrop = true
                    }
                } else {
                    shouldDrop = false
                }
            }
    }
}


#Preview {
    WorryView()
}





