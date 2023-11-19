//
//  TimerManager.swift
//  Rainbow
//
//  Created by Kasharin Mikhail on 15.11.2023.
//

import Foundation
import Combine

final class TimerService {
    private var cancelable: Cancellable?
    let timerTick = PassthroughSubject<Date, Never>()
    
    func startTimer() {
        cancelable = Timer
            .publish(every: 1, on: .main, in: .default)
            .autoconnect()
            .sink(receiveValue: timerTick.send(_:))
    }
    
    func stopTimer() {
        cancelable?.cancel()
    }
    
}


