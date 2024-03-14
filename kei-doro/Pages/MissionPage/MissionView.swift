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
                MissionList()
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

struct MissionList: View {
    var body: some View {
        NavigationLink(destination: MissionData()) {
            List(0..<2, id: \.self) { index in
                MissionData()
                    .padding(.all, 8)
                    .listRowBackground(Color.secondColor)
            }
        }
        .scrollContentBackground(.hidden)
    }
}

struct MissionData: View {
//    @State var showMissionDetail: Bool = false
    var body: some View {
        HStack {
            VStack(alignment: .leading, content: {
                Text("case1:")
                    .padding(.bottom, 8)
                Text("〇〇で△△してください")
            })
            Spacer()
            Text("失敗")
                .font(.system(size: 22))
                .fontWeight(.bold)
                .foregroundStyle(Color.errorColor)
                .padding(.trailing, 8)
        }
//        .onTapGesture {
//            self.showMissionDetail = true
//        }
//        .sheet(isPresented: $showMissionDetail, content: {
//            MissionDetailView()
//        })
    }
}

#Preview {
    MissionView()
}
