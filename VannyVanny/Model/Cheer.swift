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
    var concern: Concern?
    
    init(message: String, concern: Concern?) {
           self.id = UUID()
           self.message = message
           self.concern = concern
       }
}
