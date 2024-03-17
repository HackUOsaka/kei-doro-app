
import SwiftUI

struct DoroPlayView: View {
//    let role: Int = 1
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
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
                .presentationDetents([.large, .height(400), .fraction(0.5)])
        })
    }
}
#Preview {
    DoroPlayView()
}
