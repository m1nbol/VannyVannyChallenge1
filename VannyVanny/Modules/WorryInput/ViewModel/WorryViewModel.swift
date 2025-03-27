//
//  WorryViewModel.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import Foundation
import SwiftUI

@Observable
class WorryViewModel {
    var currentPage: Int = 0
    let startPoint: StartPoint

    var inputText: [String] = []
    
    init(startPoint: StartPoint) {
        self.startPoint = startPoint
    }
    
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
    
    func createFirstWorry() -> Concern {
        let title = inputText.indices.contains(0) ? inputText[0] : ""
        let treeImages = ["treeOne", "treeTwo", "treeThree"]
        
        let randomImage = treeImages.randomElement()!
        
        let image = UIImage(named: randomImage)
        let imageData = image?.jpegData(compressionQuality: 0.9)
        
        return Concern(title: title, imageData: imageData, cheers: [])
    }
}
