//
//  SettingItem.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

struct SettingItem<Content: View>: View {
    let layout: NeededLayout
    let content: (CGSize) -> Content
    init(layout: NeededLayout, @ViewBuilder content: @escaping (CGSize) -> Content) {
        self.content = content
        self.layout = layout
    }
    
    var body: some View {
        GeometryReader { geo in
            layout.layout {
                content(geo.size)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .font(.title3.bold())
        .frame(maxWidth: .infinity, minHeight: 150)
        .padding(.horizontal)
        .background(Color("itemGray").cornerRadius(20))
        .overlay(
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 2)
        )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .padding(.horizontal)
    }
}

enum NeededLayout {
    case horizontal
    case vertical
    
    var layout: AnyLayout {
        switch self {
        case .horizontal: return AnyLayout(HStackLayout())
        case .vertical: return AnyLayout(VStackLayout(spacing: 30))
        }
    }
}

struct SettingItem_Previews: PreviewProvider {
    static var previews: some View {
        SettingItem(layout: .horizontal, content: { _ in })
    }
}
