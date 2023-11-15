//
//  MainNavigationButton.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

struct MainNavigationButton: View {
    let title: NavigateMainScreen
    let completion: () -> ()
    
    var body: some View {
        Text(title.rawValue)
            .font(.largeTitle.bold())
            .foregroundColor(.white)
            .frame(width: 250, height: 80)
            .background(.mainScreenButtonColor(title))
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .onTapGesture {
                completion()
            }
    }
}

struct MainNavigationButton_Previews: PreviewProvider {
    static var previews: some View {
        MainNavigationButton(title: .statistic) { }
    }
}
