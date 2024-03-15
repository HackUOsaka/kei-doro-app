//
//  UserSettingViewModel.swift
//  kei-doro
//
//  Created by 布川のぞみ on 2024/03/16.
//

import Foundation
import FirebaseFirestore

class UserSettingViewModel: ObservableObject {
    let db = Firestore.firestore()
//    var updateUserData: 
    //userのnameを変える
//    func updateUserName(userId: String, name: String) async throws -> User {
//        let updateUser = User.self
//        //name更新処理
//        try await db.collection("user").document(userId).setData(["name": name], merge: true)
//    }
}
