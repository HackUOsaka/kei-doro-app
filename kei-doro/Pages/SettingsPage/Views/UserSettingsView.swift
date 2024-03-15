import SwiftUI

struct UserSettingsView: View {
    @State private var nameVal = ""
    
    var body: some View {
        ZStack() {
            Color.backColor
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                VStack {
                    SettingsNavigationBar()
                        .padding(.vertical, 24)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("name")
                        .font(.title2)
                        .foregroundColor(.mainColor)
                    
                    TextField("10文字以内で入力", text: $nameVal)
                        .padding(.vertical, 10)
                        .padding(.horizontal, 8)
                        .border(Color.secondColor)
                        .foregroundColor(.white)
                        .background(.black)
                }
                ZStack {
                    Button(action: {
                        
                    }, label: {
                        ZStack(alignment: .center) {
                            Text("保存する")
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 15)
                        .border(Color.mainColor)
                        .foregroundColor(.white)
                        .background(Color.secondColor)
                        .opacity(nameVal.isEmpty ? 0.5 : 1)
                    })
                }
                Spacer()
                .disabled(nameVal.isEmpty)
            }
            .padding(.horizontal, 16)
        }
    }
}

struct SettingsNavigationBar: View {
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        HStack {
            Spacer().overlay(
                HStack {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Close")
                            .foregroundColor(Color.secondColor)
                    })
                    Spacer()
                }
            )
            Text("設定")
                .font(.system(size: 20))
                .foregroundStyle(.white)
            Spacer()
        }
    }
}

#Preview {
    UserSettingsView()
}
