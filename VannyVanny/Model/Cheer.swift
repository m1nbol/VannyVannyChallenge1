//
//  Cheer.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import Foundation
import SwiftData

@Model
class Cheer {
    @Attribute(.unique) var id: UUID
    var message: String
    
    init(message: String) {
           self.id = UUID()
           self.message = message
       }
}
