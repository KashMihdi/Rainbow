//
//  Extension + Font.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

extension Font {
    static func letterSize(_ size: LetterSize) -> Self {
        switch size {
        case .small: return .title3
        case .medium: return title2
        case .large: return .title
        }
    }
}
