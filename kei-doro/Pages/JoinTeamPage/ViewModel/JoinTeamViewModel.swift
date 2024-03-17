//
//  JoinTeamViewModel.swift
//  kei-doro
//
//  Created by saki on 2024/03/13.
//

import Foundation
import FirebaseFirestore
class JoinTeamViewModel: ObservableObject {
    let db = Firestore.firestore()
    func getUsers(gameId: String)async throws -> [String]{
        var userName = [String]()
        let document =  try await db.collection("games").document(gameId).getDocument()
        let data = document.data()
        let users = data?["playerIds"] as! [String]
        for user in users {
            let document =  try await db.collection("users").document(user).getDocument()
            let data = document.data()
            let name = data?["name"] as! String
            userName.append(name)
            
        }
        return userName
    }
    
    func randomZeroOrOne() -> Int {
        return Int(arc4random_uniform(2))
    }
    //room idを入力して入る人がおすBtnの関数
    func postUserData(gameId: String,userId: String) async throws -> Optional<Any> {
        let savedata: UserDefaults = UserDefaults.standard
        let document = try await db.collection("games").document(gameId).getDocument()
        let data = document.data()
        var users = data?["playerIds"] as! [String]
        //useridを追加
        users.append(userId)
        
        //userIdをgameTableに追加
        try await db.collection("games").document(gameId).updateData([
            "playerIds": users
        ])
        
        let role = randomZeroOrOne()
        //playerに追加
        let playerData = try await db.collection("players").document().setData([
            "userId": userId,
            "role": role
        ])
        
        
        savedata.set(role, forKey: "role")
        return playerData
    }
}
