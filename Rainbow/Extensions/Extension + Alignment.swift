//
//  Extension + Alignment.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 19.11.2023.
//

import SwiftUI

extension Alignment {
    static func getAlignment(_ position: String) -> Alignment {
        switch position {
        case "center": return .center
        case "bottom": return .bottom
        case "leading": return .leading
        case "top": return .top
        default: return .trailing
        }
    }
}
