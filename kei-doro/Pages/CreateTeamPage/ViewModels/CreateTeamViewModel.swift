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
    
    
    func makeIcon() async throws -> String{
        let UserId = savedata.object(forKey: "UserId")
        let document = try await db.collection("users").document(UserId as! String ).getDocument()
        let data = document.data()
        let name = data?["name"] as! String
        
        
        return name
    }
    
    func createGameId(userId: String, name: String) async throws -> String{
        
        let uuid = UUID()
        let gameId = String(uuid.uuidString.prefix(6))
        try await db.collection("games").document(gameId).setData([
            "id": gameId,
            "playerIds": [userId],
            "names" : [name],
            "mode:": "kei-doro",
            "oni": "1",
            "limit": "10"])
        
        savedata.set(gameId, forKey: "GameId")    
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
    func getUsers(gameId: String) -> [String]{
        var userName = [String]()
        
        
        db.collection("games").document(gameId)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                let names = data["playerIds"] as![String]
                userName = []
                for name in names{
                    let index = name.startIndex
                    let firstName = String(name[index])
                    userName.append(firstName)
                }
                print("Current data: \(userName)")
                CreateTeamView(userId: "", gameId: "", picktime: "", pickOni: "", gameMasterName: "") .users = userName
                
                
            }
        return userName
    }
    
}
