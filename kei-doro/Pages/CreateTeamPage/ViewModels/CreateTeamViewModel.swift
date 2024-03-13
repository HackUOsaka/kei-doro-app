//
//  CreateTeamViewModel.swift
//  kei-doro
//
//  Created by saki on 2024/03/12.
//

import Foundation
import FirebaseFirestore
class CreateTeamViewModel: ObservableObject {
    let db = Firestore.firestore()
    var savedata: UserDefaults = UserDefaults.standard
    
    func makeTeam(){
        
    }
    func makeIcon() async throws -> String{
        let UserId = savedata.object(forKey: "UserId")
        let document = try await db.collection("users").document(UserId as! String).getDocument()
        let data = document.data()
        let name = data?["name"] as! String
        let index = name.startIndex
        let firstName = String(name[index])
        return firstName
    }
    
    func createGameId(userId: String) async throws -> String{
        
        let uuid = UUID()
        let gameId = String(uuid.uuidString.prefix(6))
        try await db.collection("games").document(gameId).setData([
            "id": gameId,
            "playerIds": [userId],
            "mode:": "kei-doro",
            "oni": "1",
            "limit": "10"])
        
        
        return gameId
    }
    
    func getUserId() async throws -> String{
        let UserId = savedata.object(forKey: "UserId")
        return UserId as! String
    }
    func saveTime(gameId: String, limit: String) async throws{
        
        try await db.collection("games").document(gameId).updateData([
            "limit": limit
        ])
    }
    func saveOni(gameId: String, Oni: String) async throws{
        
        try await db.collection("games").document(gameId).updateData([
            "oni": Oni
        ])
    }
    func startTimer(gameId: String) async throws{
        try await db.collection("games").document(gameId).updateData([
            "startedTime": FieldValue.serverTimestamp()
        ])
    }
}
