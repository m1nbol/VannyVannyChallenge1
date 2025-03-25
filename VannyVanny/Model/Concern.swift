//
//  Concern.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import SwiftData
import Foundation

@Model
class Concern {
    @Attribute(.unique) var id: UUID
    var title: String
    var imageData: Data?
    var cheers: [Cheer] = []

    init(title: String, imageData: Data?) {
        self.id = UUID()
        self.title = title
        self.imageData = imageData
    }
}
