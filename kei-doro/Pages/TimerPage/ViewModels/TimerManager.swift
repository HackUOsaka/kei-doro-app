//////
//////  TimerManager.swift
//////  kei-doro
//////
//////  Created by 大澤清乃 on 2024/03/16.
//////
////
////import SwiftUI
////import AudioToolbox
////
////class TimerManager: ObservableObject {
////    //Pickerで設定した"分"を格納する変数
////    @Published var minSelection: Int = 0
////    //Pickerで設定した"秒"を格納する変数
////    //    @Published var secSelection: Int = 0
////    //カウントダウン残り時間
////    @Published var duration: Double = 0
////    //カウントダウン開始前の最大時間
////    @Published var maxValue: Double = 0
////    //設定した時間が1時間以上、1時間未満1分以上、1分未満1秒以上によって変わる時間表示形式
////    @Published var displayedTimeFormat: TimeFormat = .min
////    //タイマーのステータス
////    @Published var timerStatus: TimerStatus = .stopped
////    //プログレスバー表示オン/オフの設定
//////    @Published var isProgressBarOn: Bool = true
////    //1秒ごとに発動するTimerクラスのpublishメソッド
////    var timer = Timer.publish(every: 0.05, on: .main, in: .common).autoconnect()
////    
////    //Pickerで取得した値からカウントダウン残り時間とカウントダウン開始前の最大時間を計算しその値によって時間表示形式も指定する
////    func setTimer() {
////        //残り時間をPickerから取得した時間・分・秒の値をすべて秒換算して合計して求める
////        duration = Double(minSelection * 60)
////        maxValue = duration
////        //60秒未満なら00形式、60秒以上3600秒未満なら00:00形式、3600秒以上なら00:00:00形式
////        if duration < 60 {
////            displayedTimeFormat = .sec
////        } else if duration < 3600 {
////            displayedTimeFormat = .min
////        } else {
////            displayedTimeFormat = .hr
////        }
////    }
////    
////    //カウントダウン中の残り時間を表示するためのメソッド
////    func displayTimer() -> String {
////        let hr = Int(duration) / 3600
////        let min = Int(duration) % 3600 / 60
////        let sec = Int(duration) % 3600 % 60
////        
////        switch displayedTimeFormat {
////        case .hr:
////            return String(format: "%02d:%02d:%02d", hr, min, sec)
////        case .min:
////            return String(format: "%02d:%02d", min, sec)
////        case .sec:
////            return String(format: "%02d", sec)
////        }
////    }
////}
//
//import Foundation
//import SwiftUI
//import Combine
//
//final class TimerManager: ObservableObject {
//    @Published var progressValue: CGFloat = 0.0
//    private var timerCount: CGFloat = 0.0
//    private var cancellable: AnyCancellable?
//    
//    init() {
//        startTimer()
//    }
//    
//    private func startTimer() {
//        cancellable = Timer.publish(every: 0.1, on: .main, in: .default)
//            .autoconnect()
//            .sink { [weak self] _ in
//                self?.countProgress()
//            }
//    }
//    
//    private func countProgress() {
//        if timerCount > 180 { cancellable?.cancel() }
//        timerCount = timerCount + 0.1
//        progressValue = timerCount / 180.0
//    }
//}
