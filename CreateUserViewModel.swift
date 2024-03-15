//
//  CreateUserViewModel.swift
//  kei-doro
//
//  Created by 布川のぞみ on 2024/03/16.
//

import Foundation
import FirebaseFirestore


struct User {
    var id: String
    var name: String
    var password: String
}
class CreateUserViewModel: ObservableObject {
    let db = Firestore.firestore()
    
    func createUser(name: String, completion: @escaping (Result<User, Error>) -> Void) {
        let userId = UUID().uuidString
        
        let newUser = User(id: userId, name: name, password: "あああああ")
        print("ああああああああああああ")
        print(newUser)
        
        db.collection("users").document(userId).setData(["id": userId, "name": name, "password": newUser.password]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(newUser))
            }
        }
    }
}
