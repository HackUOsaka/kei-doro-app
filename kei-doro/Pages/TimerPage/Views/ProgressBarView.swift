//
//  ProgressBarView.swift
//  kei-doro
//
//  Created by 大澤清乃 on 2024/03/16.
//

import SwiftUI

struct ProgressBarView: View {
    @EnvironmentObject var timeManager: TimeManager
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.secondColor,
                    style: StrokeStyle(
                        lineWidth: 15,
                        lineCap: .round)
                )
                .opacity(0.5)
                .frame(width: 300, height: 300)
            //プログレスバー用
            Circle()
                .trim(from: 0.0, to: CGFloat(self.timeManager.duration / self.timeManager.maxValue)) // toの値をViewModelのprogressValueを参照する
                .stroke(
                    Color.mainColor,
                    style: StrokeStyle(
                        lineWidth: 15,
                        lineCap: .round)
                )
                .frame(width: 300, height: 300)
                .rotationEffect(Angle(degrees: -90))
        }
    }
}

#Preview {
    ProgressBarView()
        .environmentObject(TimeManager())
        .previewLayout(.sizeThatFits)
}
