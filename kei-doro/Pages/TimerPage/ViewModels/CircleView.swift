//
//  CircleView.swift
//  kei-doro
//
//  Created by 大澤清乃 on 2024/03/16.
//

import SwiftUI
//消すな
struct CircleView: View {
    // ViewModelをStateObjectで宣言してCircleProgressViewModelを監視できるようにする
    @StateObject var viewModel = CircleViewModel()
    var body: some View {
        ZStack {
            Circle()
                .stroke(
                    Color.gray,
                    style: StrokeStyle(
                        lineWidth: 15,
                        lineCap: .round)
                )
                .opacity(0.5)
                .frame(width: 300, height: 300)
            Circle()
                .trim(from: 0.0, to: viewModel.progressValue) // toの値をViewModelのprogressValueを参照する
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
    CircleView()
}
