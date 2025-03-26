//
//  CheerViewModel.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import Foundation

@Observable
class CheerViewModel {
    var concern: Concern
    
    var appleIndexes: [Int] = []
    let maxPosition = 10
    var newCheerText: String = ""
    
    var selectePositionIndex: Int? = nil
    var shwoSheet: Bool = false
    
    init(concern: Concern) {
        self.concern = concern
    }
    
    let positions = [
        CGPoint(x: 0.25, y: 0.25),
        CGPoint(x: 0.4,  y: 0.2),
        CGPoint(x: 0.6,  y: 0.22),
        CGPoint(x: 0.75, y: 0.3),
        CGPoint(x: 0.3,  y: 0.4),
        CGPoint(x: 0.5,  y: 0.35),
        CGPoint(x: 0.7,  y: 0.4),
        CGPoint(x: 0.35, y: 0.55),
        CGPoint(x: 0.55, y: 0.5),
        CGPoint(x: 0.65, y: 0.6)
    ].shuffled()
}
