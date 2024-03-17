//
//  CreateUserView.swift
//  kei-doro
//
//  Created by 布川のぞみ on 2024/03/16.
//
import Foundation
import SwiftUI

struct CreateUserView: View {
    @ObservedObject var viewModel = CreateUserViewModel()
    @State var name = ""
    @State private var isHomeViewActive = false // 追加：HomeViewの表示状態を管理するState
    @StateObject var session = NFCSession()
    
    var body: some View {
        NavigationView { // 追加：NavigationViewでラップする
            ZStack {
                Color.backColor
                    .ignoresSafeArea()
                VStack {
                    ZStack {
                        TextField("名前を入力してください", text: $name)
//                            .foregroundColor(.white)
                            .frame(width: 304, height: 72)
                            .background(Color.white)
                        
                        NavigationLink(destination: HomeView(), isActive: $isHomeViewActive) {
                            EmptyView() // 追加：NavigationLinkの表示を制御するためのEmptyView
                        }
                    }
                    .frame(width: 320, height: 72)
                    .background(Color.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 4)
                            .stroke(Color.secondColor, lineWidth: 3)
                    )
                    
                    VStack {
                        Button(action: {
                            viewModel.createUser(name: name) { result in
                                switch result {
                                case .success(let newUser):
                                    print("New user created: \(newUser)")
                                    // ボタンが押されたらHomeViewに画面遷移する
                                    isHomeViewActive = true
                                case .failure(let error):
                                    print("Error creating user: \(error)")
                                    // 画面遷移に失敗した場合の処理をここに追加することもできます
                                }
                            }
                        }, label: {
                            Text("ユーザーを登録する")
                                .foregroundStyle(.white)
                                .frame(width: 320, height: 48)
                                .background(Color.secondColor)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.mainColor, lineWidth: 3)
                                )
                        })
                        .cornerRadius(4)
                        .padding(.top)

                        Button(action: {
                            session.startWriteSession(text: viewModel.userId) { error in
                                if let error = error {
                                    print(error)
                                }
                            }
                            
                        }, label: {
                            Text("NFC書き込み")
                                .foregroundStyle(Color.secondColor)
                                .frame(width: 320, height: 48)
                                .background(Color.clear)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 4)
                                        .stroke(Color.secondColor, lineWidth: 3)
                                )
                        })
                        .padding(.top, 8)
                    }
                }
            }
        }
    }
}


#Preview {
    CreateUserView()
}
