//
//  WorryViewModel.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import Foundation

@Observable
class WorryViewModel {
    var currentPage: Int = 0

    var inputText: [String] = []
    
    func currentPageUP() {
        if self.currentPage < 3 {
            currentPage += 1
        }
    }
    
    func currentPageDown() {
        if self.currentPage > 0 {
            currentPage -= 1
        }
    }
}
