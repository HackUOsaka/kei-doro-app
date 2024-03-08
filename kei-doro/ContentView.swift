//
//  ContentView.swift
//  kei-doro
//
//  Created by 井上蓮太郎 on 2024/03/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .foregroundColor(Color.mainColor)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
