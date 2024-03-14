//
//  HomeViewModel.swift
//  kei-doro
//
//  Created by 布川のぞみ on 2024/03/12.
//

import Foundation
import FirebaseFirestore
class HomeViewModel: ObservableObject {
    var savedata: UserDefaults = UserDefaults.standard
    let db = Firestore.firestore()
    
    func searchgame(gameId: String, name: String) async throws -> Bool{
        let UserId = savedata.object(forKey: "UserId")
        var idArray = [String]()
        let ref = try await db.collection("games").getDocuments()
        for document in ref.documents {
            let data = document.data()
            let id = data["id"] as! String
            idArray.append(id)
            
        }
        if idArray.contains(gameId){
         try await db.collection("games").document(gameId).updateData([
            "playerIds": FieldValue.arrayUnion([UserId]),
            "names":  FieldValue.arrayUnion([name])
            ])
            return true
        }else{
            return false
        }
       
    }
    func makeIcon() async throws -> String{
        let UserId = savedata.object(forKey: "UserId")
        let document = try await db.collection("users").document(UserId as! String).getDocument()
        let data = document.data()
        let name = data?["name"] as! String
       
        
        return name
    }
    
}

