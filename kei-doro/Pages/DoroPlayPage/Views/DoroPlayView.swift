//
//  DoroPlayView.swift
//  kei-doro
//
//  Created by 大澤清乃 on 2024/03/13.
//

import SwiftUI

struct DoroPlayView: View {
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack {
                    OtherTimerLabel()
                    ZStack(alignment: .center){
                        GameTimerLabel()
                        TimerView()
                    }.padding(.all, 40)
                }
                Spacer()
                HStack {
                    MissionButton()
                    Spacer()
                    CallButton()
                    Spacer()
                    MapButton()
                }
                .frame(width: 320)
            }
        }
    }
}

struct OtherTimerLabel: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("トランシーバー残量")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                Text("00:00:00")
                    .font(.system(size: 32))
                    .foregroundStyle(.white)
            }
            Spacer()
            //これ必要ないかも
            VStack {
                Text("ミッション終了まで")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                Text("00:00:00")
                    .font(.system(size: 32))
                    .foregroundStyle(.white)
            }
            Spacer()
        }
    }
}

struct GameTimerLabel: View {
    var body: some View {
        VStack {
            Text("ゲーム終了まで")
                .font(.subheadline)
                .foregroundStyle(.white)
            Text("00:00:00")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}

struct MissionButton: View {
    var body: some View {
        Button(action: {
            print()
        }, label: {
            Image(systemName: "checklist")
                .font(.system(size: 25))
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(Color.secondColor)
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.secondColor, lineWidth: 1))
        })
    }
}

struct CallButton: View {
    @State var showNextView: Bool = false
    var body: some View {
        NavigationStack {
            Button(action: {
                self.showNextView = true
            }, label: {
                Image(systemName: "mic.fill")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .frame(width: 120, height: 120)
                    .background(Color.secondColor)
                    .cornerRadius(60)
                //                    .overlay(
                //                        RoundedRectangle(cornerRadius: 50)
                //                            .stroke(Color.secondColor, lineWidth: 1))
            })
            .sheet(isPresented: $showNextView, content: {
                CallView()
            })
        }
        .frame(width: 120, height: 120)
        .cornerRadius(60)
        .overlay(
            RoundedRectangle(cornerRadius: 60)
                .stroke(Color.mainColor, lineWidth: 4))
    }
}

struct MapButton: View {
    var body: some View {
        Button(action: {
            print()
        }, label: {
            Image(systemName: "map")
                .font(.system(size: 25))
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(Color.secondColor)
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.secondColor, lineWidth: 1))
        })
    }
}


#Preview {
    DoroPlayView()
}
