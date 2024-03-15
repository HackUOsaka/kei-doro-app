//
//  SignUpView.swift
//  kei-doro
//
//  Created by 布川のぞみ on 2024/03/16.
//


import SwiftUI

struct SignUpView: View {
    @State private var createUser = false
    
    var body: some View {
        Button{
            createUser.toggle()
        } label: {
            Text("ユーザー情報を登録")
        }
        .sheet(isPresented: $createUser){
            CreateUserView()
        }
    }
}

#Preview {
    SignUpView()
}
