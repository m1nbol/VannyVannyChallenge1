//
//  WorryView.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftUI

enum StartPoint {
    case onboardStart
    case homeStart
}

struct WorryView: View {
    
    var viewModel: WorryViewModel
    @EnvironmentObject var container: DIContainer
    @EnvironmentObject var appFlowViewModel: AppFlowViewModel
    
    @Environment(\.modelContext) private var modelContext
    
    init(startPoint: StartPoint) {
        self.viewModel = .init(startPoint: startPoint)
    }
    
    var body: some View {
        VStack(content: {
            
            WorryViewContents(viewModel: viewModel)
                .environmentObject(container)
                .environmentObject(appFlowViewModel)
            
            Spacer()
            
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
                            if viewModel.currentPage < 3 {
                                viewModel.currentPageUP()
                            } else {
                                let firstWorry = viewModel.createFirstWorry()
                                modelContext.insert(firstWorry)
                                try? modelContext.save()
                                
                                if viewModel.startPoint == .onboardStart {
                                    appFlowViewModel.appFlowState = .home
                                } else if viewModel.startPoint == .homeStart {
                                    container.navigationRouter.pop()
                                }
                            }
                        }, width: 180, height: 60)
                    }
                }
            }
            
        })
        .background {
            Image(.background)
        }
        .safeAreaPadding(EdgeInsets(top: 0, leading: 16, bottom: 30, trailing: 16))
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    WorryView(startPoint: .homeStart)
        .environmentObject(DIContainer())
        .environmentObject(AppFlowViewModel())
}
