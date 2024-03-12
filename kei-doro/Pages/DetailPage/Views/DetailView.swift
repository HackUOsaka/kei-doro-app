//
//  DetailView.swift
//  kei-doro
//
//  Created by 布川のぞみ on 2024/03/11.
//

import SwiftUI



struct DetailView: View {
    @State var timeselection = 0
    let exampleData = ["name1", "name2", "name3"]
    let colors: [Color] = [.red, .blue, .green, .yellow, .pink, .orange]
    var body: some View {
        VStack(alignment: .center) {
            VStack(alignment: .leading, spacing: 30) {
                Text("Room ID：111111").font(.title2).bold()
                VStack(alignment: .leading) {
                    Text("参加ユーザー").font(.title3).bold().padding(.top)
                    HStack() {
                        ForEach(exampleData, id: \.self) {
                            data in Text(data).frame(width: 50, height: 50).background(colors.randomElement()).clipShape(Circle()).shadow(radius: 7).padding()
                        }
                    }
                }
                HStack() {
                    Text("プレイ時間").font(.title3).bold()
                    Picker(selection: $timeselection, label: Text("Number")) {
                        ForEach(0..<100, id: \.self) { number in
                            Text("\(number * 5)分")
                        }
                    }
                }
                Text("地域指定").bold().font(.title3)
                Text("鬼の人数: \(exampleData.count)人").bold().font(.title3).padding(.bottom)
            }
            Spacer()
            Button(action: {}, label: {
                Text("GAME START").frame(width: 300, height: 40).background(Color.gray).foregroundColor(.black).shadow(radius: 3)
            })
            Spacer()
        }
    }
    }

#Preview {
    DetailView()
}
