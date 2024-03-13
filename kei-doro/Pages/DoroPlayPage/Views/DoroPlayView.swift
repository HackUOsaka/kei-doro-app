//
//  DoroPlayView.swift
//  kei-doro
//
//  Created by 大澤清乃 on 2024/03/13.
//

import SwiftUI

struct DoroPlayView: View {
    var body: some View {
        VStack {
            Spacer()
            HStack {
                MissionButton()
                CallButton()
                MapButton()
            }
        }
    }
}

struct MissionButton: View {
    @State var showNextView: Bool = false
    var body: some View {
        Button(action: {
            self.showNextView = true
        }, label: {
            Text("mission")
                .frame(width: 80, height: 80)
                .foregroundColor(.black)
                .background(Color.mainColor)
                .cornerRadius(40)
        })
        .sheet(isPresented: $showNextView, content: {
            CallView()
        })
    }
}

struct CallButton: View {
    var body: some View {
        NavigationStack {
            Button(action: {
                print()
            }, label: {
                Text("Microphone")
                    .frame(width: 100, height: 100)
                    .foregroundColor(.black)
                    .background(.white)
                    .cornerRadius(50)
                    .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.mainColor, lineWidth: 5))
            })
        }
        .frame(width: 110, height: 110)
    }
}

struct MapButton: View {
    var body: some View {
        Button(action: {
            print()
        }, label: {
            Text("mission")
                .frame(width: 80, height: 80)
                .foregroundColor(.black)
                .background(Color.mainColor)
                .cornerRadius(40)
        })
    }
}


#Preview {
    DoroPlayView()
}
