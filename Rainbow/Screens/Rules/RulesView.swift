//
//  RulesView.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

struct RulesView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                VStack {
                    Image(systemName: "xmark")
                        .font(.largeTitle)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .onTapGesture { dismiss() }
                    Text("Правила игра")
                        .font(.largeTitle.bold())
                }
                
                Group {
                    Text("На экране в случайном месте появляется слово,обозначающее цвет, например: ")
                    + Text("написано «синий»")
                        .foregroundColor(.red)
                }
                .font(.title3.bold())
                
                HStack(spacing: 30) {
                    VStack {
                        Text("Подложка выключена")
                            .font(.subheadline)
                        
                        Text("синий")
                            .font(.title3.bold())
                            .foregroundColor(.green)
                            .padding(.all, 10)
                            .padding(.horizontal)
                    }
                    
                    VStack {
                        Text("Подложка включена")
                            .font(.subheadline)
                        Text("синий")
                            .font(.title3.bold())
                            .foregroundColor(.white)
                            .padding(.all, 10)
                            .padding(.horizontal, 30)
                            .background(.green)
                            .clipShape(Capsule())
                    }
                }
                
                Group {
                    Text("Нужно произнести вслух цвет слова (если опция «подложка для букв» выключена) или цвет фона, на котором написано слово (если опция «подложка для букв» включена): ")
                    + Text("говорим «зеленый»")
                        .foregroundColor(.red)
                }
                .font(.title3.bold())
                
                Text("В игре можно изменять скорость от 1x до 5x. А так же длительность игры.")
                    .font(.title3.bold())
            }
            .padding([.horizontal, .top])
        }
    }
}

struct RulesView_Previews: PreviewProvider {
    static var previews: some View {
        RulesView()
    }
}
