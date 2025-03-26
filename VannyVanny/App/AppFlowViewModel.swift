//
//  AppFlowViewModel.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/26/25.
//

import Foundation

class AppFlowViewModel: ObservableObject {
    @Published var appFlowState: AppFlow = .greeting
    
    enum AppFlow {
        case greeting
        case inputWorry
        case home
    }
}
