
import SwiftUI

struct DoroPlayView: View {
    let role: Bool = false
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
        }
    }
}

struct DoroTimerLabel: View {
    var body: some View {
        HStack {
            Spacer()
            VStack {
                Text("トランシーバー残量")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                Text("00:00:00")
                    .font(.system(size: 32))
                    .foregroundStyle(.white)
            }
            Spacer()
            //これ必要ないかも
            VStack {
                Text("ミッション終了まで")
                    .font(.subheadline)
                    .foregroundStyle(.white)
                Text("00:00:00")
                    .font(.system(size: 32))
                    .foregroundStyle(.white)
            }
            Spacer()
        }
    }
}

struct MissionButton: View {
    @State var toMissionView: Bool = false
    var body: some View {
        Button(action: {
            self.toMissionView = true
        }, label: {
            Image(systemName: "checklist")
                .font(.system(size: 25))
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(Color.secondColor)
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.secondColor, lineWidth: 1))
        })
        .sheet(isPresented: $toMissionView, content: {
           MissionView()
        })
    }
}
#Preview {
    DoroPlayView()
}
