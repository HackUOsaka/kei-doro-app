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
                    missionDetailTextVew()
                    missionCount()
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

struct missionDetailTextVew: View {
    var body: some View {
        
        Text("")
            .frame(width: 342, height: 80)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.mainColor, lineWidth: 2)
            )
    }
}

struct missionCount: View {
    var body: some View {
        Text("タッチできた人数")
            .foregroundStyle(.white)
            .font(.system(size: 20))
            .padding(.top, 24)
        Text("1")//あとで変えるよーーーーー
            .font(.system(size: 40))
            .foregroundStyle(.white)
            .padding(.top, 4)
    }
}

#Preview {
    MissionView()
}
