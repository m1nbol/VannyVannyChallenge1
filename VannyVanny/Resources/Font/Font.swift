//
//  Font.swift
//  VannyVanny
//
//  Created by Apple Coding machine on 3/25/25.
//

import Foundation
import SwiftUI

extension Font {
    enum Pretend {
        case bold
        case semibold
        case medium
        case regular
        case light
        
        var value: String {
            switch self {
            case .bold:
                return "Pretendard-Bold"
            case .semibold:
                return "Pretendard-SemiBold"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .light:
                return "Pretendard-Light"
            }
        }
    }
    
    enum Ownglyph {
        case regular
        
        var value: String {
            switch self {
            case .regular:
                return "Ownglyph_wiseelist-Rg"
            }
        }
    }
    
    static func pretend(type: Pretend, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
    
    static func ownglyph(type: Ownglyph, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
}
