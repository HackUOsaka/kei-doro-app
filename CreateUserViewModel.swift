//
//  CreateUserViewModel.swift
//  kei-doro
//
//  Created by 布川のぞみ on 2024/03/16.
//

import Foundation
import FirebaseFirestore


class CreateUserViewModel: ObservableObject {
    let db = Firestore.firestore()
    var newUser: [User] = []
    let saveData: UserDefaults = UserDefaults.standard

    func createUser(name: String, completion: @escaping (Result<User, Error>) -> Void) {
        let userId = UUID().uuidString
        let userData = User(userId: userId, name: name, password: "あああああ")
        self.newUser.append(userData)
        
        print("ああああああああああああ")
        print(newUser)
        print("いいいい")
        print(userData)
        
        db.collection("users").document(userId).setData(["id": userId, "name": name, "password": userData.password]) { error in
            if let error = error {
                completion(.failure(error))
            } else {
                completion(.success(userData))
            }
        }
        
        saveData.set(userData.userId, forKey: "userId")
        saveData.set(userData.name, forKey: "userName")
        
        print("うううううううう")
        print(saveData.object(forKey: "userId"))
    }
}

