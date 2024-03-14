
import SwiftUI

struct PlayView: View {
    @ObservedObject var gameId: Model
    //ここも編集する！
    let role: Bool = true
    var body: some View {
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack {
                    if role == true {
                        if true {
                            DoroTimerLabel()
                        }
                        if false {
                            KeiTimerLabel()
                        }
                    } else {
                        if true {
                            KeiTimerLabel()
                        }
                        if false {
                            DoroTimerLabel()
                        }
                    }
                    ZStack(alignment: .center){
                        GameTimerLabel()
                        TimerView()
                    }.padding(.all, 40)
                }
                Spacer()
                HStack {
                    if role == true {
                        if true {
                            MissionButton()
                        }
                        if false {
                            ArrestNumberLabel()
                        }
                    } else {
                        if true {
                            ArrestNumberLabel()
                        }
                        if false {
                            MissionButton()
                        }
                    }
                    Spacer()
                    CallButton()
                    Spacer()
                    MapButton()
                }
                .frame(width: 320)
            }
        }
    }
}

struct GameTimerLabel: View {
    var body: some View {
        VStack {
            Text("ゲーム終了まで")
                .font(.subheadline)
                .foregroundStyle(.white)
            Text("00:00:00")
                .font(.largeTitle)
                .foregroundStyle(.white)
        }
    }
}

struct CallButton: View {
    @State var showChatView: Bool = false
    var body: some View {
        NavigationStack {
            Button(action: {
                self.showChatView = true
            }, label: {
                Image(systemName: "mic.fill")
                    .font(.system(size: 25))
                    .foregroundColor(.white)
                    .frame(width: 120, height: 120)
                    .background(Color.secondColor)
                    .cornerRadius(60)
            })
            .sheet(isPresented: $showChatView, content: {
                ChatView()
            })
        }
        .frame(width: 120, height: 120)
        .cornerRadius(60)
        .overlay(
            RoundedRectangle(cornerRadius: 60)
                .stroke(Color.mainColor, lineWidth: 4))
    }
}

struct MapButton: View {
    var body: some View {
        Button(action: {
            print()
        }, label: {
            Image(systemName: "map")
                .font(.system(size: 25))
                .foregroundColor(.white)
                .frame(width: 80, height: 80)
                .background(Color.secondColor)
                .cornerRadius(40)
                .overlay(
                    RoundedRectangle(cornerRadius: 50)
                        .stroke(Color.secondColor, lineWidth: 1))
        })
    }
}


#Preview {
    PlayView()
}
