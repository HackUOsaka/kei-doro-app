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
    
    func getTime(gameId: String)async throws -> String{
        let document =  try await db.collection("games").document(gameId).getDocument()
        let data = document.data()
        let time = data?["limit"] as! String
        return time
        
    }
    func getOni(gameId: String)async throws -> String{
        let document =  try await db.collection("games").document(gameId).getDocument()
        let data = document.data()
        let oni = data?["oni"] as! String
        return oni
        
    }
}
