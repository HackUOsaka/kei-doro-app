//
//  CreateUserView.swift
//  kei-doro
//
//  Created by 布川のぞみ on 2024/03/16.
//
import Foundation
//import SwiftUI
//struct CreateUserView: View {
//    @ObservedObject var viewModel = CreateUserViewModel()
//    @State var name = ""
//    var body: some View {
//        VStack {
//            TextField("名前を入力してください", text: $name)
//            Button(action: {
//                viewModel.createUser(name: name) { result in
//                    switch result {
//                    case .success(let newUser):
//                        print("New user created: \(newUser)")
//                    case .failure(let error):
//                        print("Error creating user: \(error)")
//                    }
//                }
//            }) {
//                Text("ユーザーを登録する")
//            }
//        }
//    }
//}

import SwiftUI

struct CreateUserView: View {
    @ObservedObject var viewModel = CreateUserViewModel()
    @State var name = ""
    @State private var isHomeViewActive = false // 追加：HomeViewの表示状態を管理するState
    @StateObject var session = NFCSession()

    var body: some View {
        NavigationView { // 追加：NavigationViewでラップする
            VStack {
                TextField("名前を入力してください", text: $name)
                NavigationLink(destination: HomeView(), isActive: $isHomeViewActive) {
                    EmptyView() // 追加：NavigationLinkの表示を制御するためのEmptyView
                }
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
                }) {
                    Text("ユーザーを登録する")
                }
                Button(action: {
              

                    session.startWriteSession(text: viewModel.userId) { error in
                                                   if let error = error {
                                                      print(error)
                                                   }
                                               }

                }, label: {
                    Text("NFC書き込み")
                })
            }
        }
    }
}


#Preview {
    CreateUserView()
}
