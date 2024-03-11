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
                    Text("GROUPを作成").bold().padding().frame(width: 200, height: 50).foregroundColor(Color.black).background(Color.mainColor).cornerRadius(15)
                }
//                NavigationLink(destionation: ) {
                //                    Text("GAMEに参加する")
//                }
            }
        }
    }
}
    #Preview {
        HomeView()
    }
