//
//  KeiPlayView.swift
//  kei-doro
//
//  Created by 大澤清乃 on 2024/03/14.
//

import SwiftUI

struct KeiPlayView: View {
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
        }
    }
}

struct ArrestNumberLabel: View {
    let arrest = ["", ""]
    var body: some View {
        VStack {
            Text("逮捕者")
                .font(.system(size: 16))
                .foregroundStyle(.white)
            Text("\(arrest.count)")
                .font(.system(size: 24))
                .foregroundStyle(.white)
        }
        .frame(width: 80, height: 80)
        .background(Color.secondColor)
        .cornerRadius(40)
        .overlay(
            RoundedRectangle(cornerRadius: 50)
                .stroke(Color.secondColor, lineWidth: 1))
    }
}

#Preview {
    KeiPlayView()
}
