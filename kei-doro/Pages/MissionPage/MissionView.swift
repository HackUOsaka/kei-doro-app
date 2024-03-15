//
//  MissionView.swift
//  kei-doro
//
//  Created by 大澤清乃 on 2024/03/14.
//

import SwiftUI

struct MissionView: View {
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            VStack {
                VStack {
                    NavigationBarView()
                        .padding(.vertical, 24)
                }
            }
        }
    }
}

struct NavigationBarView: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        HStack {
            Spacer().overlay(
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Close")
                            .padding(.leading, 16)
                            .foregroundColor(Color.secondColor)
                    })
                    Spacer()
                }
            )
            Text("MissionLabel")
                .font(.system(size: 20))
                .foregroundStyle(.white)
            Spacer()
        }
    }
}

//struct missionDetailVIew: View {
//    var body: some View {
//
//    }
//}

#Preview {
    MissionView()
}
