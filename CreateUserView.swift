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
    var body: some View {
        VStack {
            TextField("名前を入力してください", text: $name)
            Button(action: {
                viewModel.createUser(name: name) { result in
                    switch result {
                    case .success(let newUser):
                        print("New user created: \(newUser)")
                    case .failure(let error):
                        print("Error creating user: \(error)")
                    }
                }
            }) {
                Text("ユーザーを登録する")
            }
        }
    }
}


#Preview {
    CreateUserView()
}
