//
//  WorryView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

struct WorryView: View {
    
    var viewModel: WorryViewModel
    
    init(startPoint: StartPoint) {
        self.viewModel = .init(startPoint: startPoint)
    }
    
    var body: some View {
        VStack(content: {
            
            VStack(content: {
                
                WorryViewContents(viewModel: viewModel)
                
                Spacer().frame(height: 40)
                
                
                HStack {
                    if viewModel.currentPage == 0 {
                        Spacer()
                        CustomMainButton(buttonStyle: .ok, action: {
                            viewModel.currentPageUP()
                        }, width: 180, height: 60)
                    }
                    
                    else {
                        
                        if viewModel.currentPage >= 1 {
                            CustomMainButton(buttonStyle: .before, action: {
                                viewModel.currentPageDown()
                            }, width: 180, height: 60)
                            
                            CustomMainButton(buttonStyle: viewModel.currentPage < 3 ? .next : .plant, action: {
                                viewModel.currentPageUP()
                            }, width: 180, height: 60)
                        }
                        
                        
                        
                        
                        
                    }
                }
                
                CustomMainButton(buttonStyle: viewModel.currentPage < 3 ? .next : .ok, action: {
                    viewModel.currentPageUP()
                }, width: 180, height: 60)
                
            }
        })
        .background {
            Image(.background)
        }
        .safeAreaPadding(EdgeInsets(top: 0, leading: 16, bottom: 30, trailing: 16))
        .border(Color.green)
    }
}

#Preview {
    WorryView(startPoint: .homeStart)
}

enum StartPoint {
    case onboardStart
    case homeStart
}
