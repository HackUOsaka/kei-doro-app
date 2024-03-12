//
//  CallView.swift
//  kei-doro
//
//  Created by 大澤清乃 on 2024/03/12.
//

import SwiftUI

struct CallView: View {
    var body: some View {
        Button(action: {
            print()
        }, label: {
            Text("Microphone")
        })
        .frame(width: 300, height: 300)
        .foregroundColor(.black)
        .background(.white)
        .overlay(
        RoundedRectangle(cornerRadius: 150)
            .stroke(Color.mainClor, lineWidth: 3)
        )
    }
}

#Preview {
    CallView()
}

extension Color {
    static let mainClor = Color("MainColor")
}
