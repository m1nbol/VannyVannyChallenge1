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
    
    init(concern: Concern) {
        self.concern = concern
    }
}
