//
//  GameView.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 15.11.2023.
//

import SwiftUI

struct GameView: View {
    @EnvironmentObject var vm: DataManager
    @Environment(\.dismiss) var dismiss
    let alignment: [Alignment] = [.bottom, .center, .leading, .top, .trailing]
    var body: some View {
        VStack {
            ForEach(0..<5, id: \.self) { _ in
                ZStack {
                    QuestionItem(setting: vm.settings) { _ in
                        //
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: vm.settings.wordArrangement == .random ? alignment.randomElement()! : .center)
            }
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .safeAreaInset(edge: .top) {
            HStack {
                Image(systemName: "arrow.left")
                    .onTapGesture {
                        dismiss()
                    }
                Spacer()
                Text("01:00")
                Spacer()
                Image(systemName: "play.fill")
            }
            .padding(.horizontal)
            .font(.largeTitle)
        }
        .safeAreaInset(edge: .bottom) {
            Text("x2")
                .font(.largeTitle)
                .padding()
                .background(.yellow)
                .clipShape(Circle())
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.trailing)
        }
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
            .environmentObject(DataManager())
    }
}