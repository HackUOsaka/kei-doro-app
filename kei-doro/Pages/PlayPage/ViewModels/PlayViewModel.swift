//
//  PlayViewModel.swift
//  kei-doro
//
//  Created by 布川のぞみ on 2024/03/15.
//

import Foundation
import FirebaseFirestore

class PlayViewModel: ObservableObject {
    let db = Firestore.firestore()
    
    //gameに参加してるuserのnameを取得
    func getGameData(gameId: String) async throws -> [String] {
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
    
    //時間を取得
    func getTime(gameId: String) async throws -> CGFloat {
        let document = try await db.collection("games").document(gameId).getDocument()
        let data = document.data()
        let timeString = data?["limit"] as! String
        guard let time = Int(timeString) else {
            throw MyError.invalidTimeString
        }
        return CGFloat(time * 60)
    }

    enum MyError: Error {
        case invalidTimeString
    }
}
