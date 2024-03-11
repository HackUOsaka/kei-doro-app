//
//  HomeView.swift
//  kei-doro
//
//  Created by 布川のぞみ on 2024/03/10.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink(destination: NFCView()) {
                    Text("START").bold().padding().frame(width: 200, height: 100).foregroundColor(Color.black).background(Color.mainColor).cornerRadius(10)
                }
//                NavigationLink(destionation: ) {
//                                    Text("GAMEに参加する").bold().padding().frame(width: 200, height: 100).foregroundColor(Color.black).background(Color.mainColor).cornerRadius(10)
//                }
            }
        }
    }
}
    #Preview {
        HomeView()
    }
