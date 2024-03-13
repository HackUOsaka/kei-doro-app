//
//  CircleProgressViewModel.swift
//  kei-doro
//
//  Created by 大澤清乃 on 2024/03/13.
//

import Foundation
import SwiftUI
import Combine

final class CircleProgressViewModel: ObservableObject {
    @Published var progressValue: CGFloat = 0.0
    private var timerCount: CGFloat = 0.0
    private var cancellable: AnyCancellable?
    
    init() {
        startTimer()
    }
    
    private func startTimer() {
        cancellable = Timer.publish(every: 0.1, on: .main, in: .default)
            .autoconnect()
            .sink { [weak self] _ in
                self?.countProgress()
            }
    }
    
    private func countProgress() {
        if timerCount > 60 { cancellable?.cancel() }
        timerCount = timerCount + 0.1
        progressValue = timerCount / 60.0
    }
}
