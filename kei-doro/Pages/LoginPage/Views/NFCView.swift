import SwiftUI

struct NFCView: View {
    @StateObject  var session = NFCSession()
    @ObservedObject var viewModel: NFCViewModel
    @State private var alertMessage = ""
    @State private var isAlertShown = false
    
    var randomId = UUID().uuidString
    var body: some View {
        Button(action: {
            session.startReadSession { text, error in
                               if let error = error {
                                   alertMessage = error.localizedDescription
                               } else {
                                   alertMessage = "読み込みました！"
                                   Task{
                                       do{
                                           try await viewModel.saveUserId(UserId: text ?? "")
                                       }
                                       catch{
                                           print(error)
                                       }
                                   }
                                  
                                   //違うNFC読み込まれた時どうしよう・・・
                                   
                                   
                               }
                               isAlertShown = true
                           }

        }, label: {
            Text("NFC読み込み")
        })
        Button(action: {
        
            session.startWriteSession(text: randomId) { error in
                               if let error = error {
                                   alertMessage = error.localizedDescription
                                   isAlertShown = true
                               }
                           }
           
        }, label: {
            Text("テスト用NFC書き込み")
        })
        .alert(isPresented: $isAlertShown) {
                    Alert(
                        title: Text(""),
                        message: Text(alertMessage),
                        dismissButton: .default(Text("OK")))
                }
    }
    
}

#Preview {
    NFCView(viewModel: NFCViewModel())
}
