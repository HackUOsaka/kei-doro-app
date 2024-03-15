import SwiftUI

struct NFCView: View {
    @StateObject  var session = NFCSession()
    @ObservedObject var viewModel = NFCViewModel()
    @State private var alertMessage = ""
    @State private var isAlertShown = false
    
    var randomId = UUID().uuidString
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            VStack {
                Image("logoImage")
                    .resizable()
                    .frame(width: 300, height: 300)
                    .scaledToFit()
                VStack {
                    getNFC()
                    getTestNFC()
                        .padding(20)
                }
            }
        }
        .alert(isPresented: $isAlertShown) {
            Alert(
                title: Text(""),
                message: Text(alertMessage),
                dismissButton: .default(Text("OK")))
        }
        //シュミレーターでやる人はこの辺のコード入ります
        
//        .onAppear(){
//            var savedata: UserDefaults = UserDefaults.standard
//            let random = UUID().uuidString
//            savedata.set(random, forKey: "UserId")
//            
//            Task{
//                do{
//                    try await viewModel.saveUserId(UserId: random)
//                }
//                catch{
//                    print(error)
//                }
//            }
//        }
    }
}

struct getNFC: View {
    @StateObject  var session = NFCSession()
    @ObservedObject var viewModel = NFCViewModel()
    @State private var alertMessage = ""
    @State private var isAlertShown = false
    
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
                .foregroundStyle(Color.secondColor)
                .font(.system(size: 22))
                .bold()
//                .underline()
                .frame(width: 320, height: 56)
//                .background(Color.secondColor)
                .overlay(
                    RoundedRectangle(cornerRadius: 4)
                        .stroke(Color.secondColor, lineWidth: 5)
                )
        })
        .cornerRadius(4)
    }
}

struct getTestNFC: View {    
    @StateObject  var session = NFCSession()
    @ObservedObject var viewModel = NFCViewModel()
    @State private var alertMessage = ""
    @State private var isAlertShown = false
    
    var randomId = UUID().uuidString

    var body: some View {
        Button(action: {
            session.startWriteSession(text: randomId) { error in
                if let error = error {
                    alertMessage = error.localizedDescription
                    isAlertShown = true
                }
            }
            
        }, label: {
            Text("テスト用NFC書き込み")
                .foregroundStyle(Color.secondColor)
        })
    }
}

#Preview {
    NFCView(viewModel: NFCViewModel())
}
