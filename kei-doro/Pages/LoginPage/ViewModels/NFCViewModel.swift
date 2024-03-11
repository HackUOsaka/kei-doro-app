import SwiftUI

class NFCViewModel: ObservableObject {
    var savedata: UserDefaults = UserDefaults.standard
    
    func saveUserId(UserId: String){
        
        savedata.set(UserId, forKey: "userId")
    }
}
