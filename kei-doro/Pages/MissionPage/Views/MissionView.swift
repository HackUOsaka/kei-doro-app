import SwiftUI

struct MissionView: View {
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            VStack {
                VStack {
                    NavigationBarView()
                        .padding(.vertical, 24)
                    missionDetailTextVew()
                    missionCount()
                    sendButton()
                }
            }
        }
    }
}

struct NavigationBarView: View {
    @State private var isShowAlert = false
    @Environment(\.dismiss) private var dismiss
    var body: some View {
        HStack {
            Spacer().overlay(
                HStack {
                    Button(action: {
                        isShowAlert.toggle()
//                        dismiss()
                    }, label: {
                        Text("Close")
                            .padding(.leading, 16)
                            .foregroundColor(Color.secondColor)
                    })
                    Spacer()
                }
            )
            Text("MissionLabel")
                .font(.system(size: 20))
                .foregroundStyle(.white)
            Spacer()
        }
        .alert("ミッションを中断する", isPresented: $isShowAlert) {
            Button("中断する", role: .destructive) {
                dismiss()
            }
        } message: {
            Text("ミッション内容がリセットされます")
        }
    }
}

struct missionDetailTextVew: View {
    var body: some View {
        
        Text("3人分のNFCコードを\n読み込んでください")
            .foregroundStyle(.white)
            .frame(width: 342, height: 80)
            .overlay(
                RoundedRectangle(cornerRadius: 4)
                    .stroke(Color.mainColor, lineWidth: 2)
            )
    }
}

struct missionCount: View {
    var body: some View {
        Text("読み込んだ人数")
            .foregroundStyle(.white)
            .font(.system(size: 20))
            .padding(.top, 24)
        Text("1")//あとで変えるよーーーーー
            .font(.system(size: 40))
            .foregroundStyle(.white)
            .padding(.top, 4)
    }
}

struct sendButton: View {
    var body: some View {
        Button(action: {
            print()
        }, label: {
            Text("送信")
        })
        .frame(width: 342, height: 64)
        .foregroundColor(.white)
        .background(Color.secondColor)
        .overlay(
            RoundedRectangle(cornerRadius: 4)
                .stroke(Color.mainColor, lineWidth: 2)
        )
    }
}

#Preview {
    MissionView()
}
