//
//  SettingsView.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 14.11.2023.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var vm: DataManager
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                gameTime
                taskSpeed
                checkTask
                letterColor
                letterSize
                letterBacking
                backgroundColor
                arrangementWord
            }
        }
        .background(Color.background(name: vm.backgroundColor))
        .safeAreaInset(edge: .top) {
            HStack(spacing: 20) {
                Image(systemName: "arrow.left")
                    .onTapGesture {
                        dismiss()
                    }
                Text("Настройки")
            }
            .padding(.horizontal)
            .font(.largeTitle.bold())
            .frame(maxWidth: .infinity, minHeight: 50, alignment: .leading)
            .background(.gray)
        }
    }
}

// MARK: - Subviews Module
private extension SettingsView {
    
    /// Game Time Module
    var gameTime: some View {
        SettingItem(layout: .vertical) { geo in
            Text("Время игра, мин.")
            HStack {
                Text("1")
                Slider(value: fromSecondToMinuteBinding(), in: 1...10, step: 1)
                Text((vm.gameTime / 60).formatted())
            }
        }
    }
    
    /// Task Speed Module
    var taskSpeed: some View {
        SettingItem(layout: .vertical) { geo in
            Text("Скорость заданий, сек.")
            HStack {
                Text("1")
                Slider(value: $vm.questionTime, in: 1...5, step: 1)
                Text((vm.questionTime).formatted())
            }
        }
    }
    
    /// Check Task Module
    var checkTask: some View {
        SettingItem(layout: .horizontal) { geo in
            Text("Игра с проверкой задания")
                .frame(alignment: .leading)
            Spacer()
            Toggle("", isOn: $vm.taskCheck)
                .frame(width: geo.width * 0.2)
        }
    }
    
    /// Letter Color Module
    var letterColor: some View {
        SettingItem(layout: .horizontal) { geo in
            Text("Цвета букв")
                .frame(width: geo.width * 0.40, alignment: .leading)
            
            LazyVGrid(columns: Array(repeating: GridItem(.flexible(), spacing: 5), count: 6)) {
                ForEach(LetterColor.allCases, id: \.rawValue) { color in
                    ZStack {
                        Color.letterColor(name: color)
                        Image(systemName: "checkmark")
                            .foregroundColor(vm.letterColor.contains(color) ? .white : .clear)
                    }
                    .frame(height: 30)
                    .onTapGesture {
                        vm.letterColor.contains(color)
                            ? vm.letterColor.removeAll(where: { $0 == color} )
                            : vm.letterColor.append(color)
                        
                        print(vm.letterColor.count)
                    }
                }
            }
            .frame(width: geo.width * 0.60)
        }
    }
    
    /// Letter Size Module
    var letterSize: some View {
        SettingItem(layout: .vertical) { geo in
            Text("Размер букв")
            HStack {
                Stepper {
                    Text("Aa")
                        .font(Font.letterSize(vm.letterSize))
                } onIncrement: {
                    vm.letterSize.next()
                } onDecrement: {
                    vm.letterSize.previos()
                }
            }
        }
    }
    
    /// Letter Backing
    var letterBacking: some View {
        SettingItem(layout: .horizontal) { geo in
            Text("Подложка для букв")
                .frame(alignment: .leading)
            Spacer()
            Toggle("", isOn: $vm.lettersBacking)
                .frame(width: geo.width * 0.2)
        }
    }
    
    /// BackGround Color Module
    var backgroundColor: some View {
        SettingItem(layout: .vertical) { geo in
            Text("Цвет фона")
            Picker("", selection: $vm.backgroundColor) {
                ForEach(BackgroundColor.allCases, id: \.self) { color in
                    Text(color.rawValue)
                }
            }
            .pickerStyle(.segmented)
        }
    }
    
    /// Arrangement Word Module
    var arrangementWord: some View {
        SettingItem(layout: .vertical) { geo in
            Text("Расположение слов на экране")
            Picker("", selection: $vm.wordArrangement) {
                ForEach(WordArrangement.allCases, id: \.self) {
                    Text($0.rawValue)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

// MARK: - Custom Bindings
private extension SettingsView {
    func fromSecondToMinuteBinding() -> Binding<Double> {
        .init(
            get: { vm.gameTime / 60 },
            set: { vm.gameTime = $0 * 60 })
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
            .environmentObject(DataManager())
    }
}

