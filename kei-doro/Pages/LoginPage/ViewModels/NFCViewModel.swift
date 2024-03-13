import SwiftUI
import FirebaseFirestore

class NFCViewModel: ObservableObject {
    var savedata: UserDefaults = UserDefaults.standard
    let db = Firestore.firestore()
 
    
    func saveUserId(UserId: String) async throws{
        let document = try await db.collection("users").document(UserId).getDocument()
        let data = document.data()
        let userId = data?["id"]
        if userId as? String == nil{
            try await db.collection("users").document(UserId).setData([
                "id": UserId,
                "name": "guest"])
        }
        
        
    }
}
