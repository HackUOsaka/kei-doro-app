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
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            VStack {
                Image("logoImage")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 24)
                Button{
                    createUser.toggle()
                } label: {
                    Text("ユーザー情報を登録")
                        .foregroundStyle(Color.secondColor)
                        .frame(width: 320, height: 72)
                        .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.secondColor, lineWidth: 2)
                        )
                }
                .fullScreenCover(isPresented: $createUser, content: {
                    CreateUserView()
                })
            }
        }
    }
}

#Preview {
    SignUpView()
}
