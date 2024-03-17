
import SwiftUI

struct PlayView: View {
    let savedata: UserDefaults = UserDefaults.standard
    //ここも編集する！
    var body: some View {
        let role = savedata.integer(forKey: "role")
        ZStack {
            Color.backColor
                .ignoresSafeArea()
            VStack {
                Spacer()
                VStack {
                    ZStack(alignment: .center){
                        TimerView()
                        CircleView()
                    }.padding(.all, 40)
                }
                Spacer()
                HStack {
                    if role == 1 {
                        if true {
                            MissionButton()
                        }
                        if false {
                            ArrestNumberLabel()
                        }
                    } else if role == 0 {
                        if true {
                            ArrestNumberLabel()
                        }
                        if false {
                            MissionButton()
                        }
                    }
                    Spacer()
//                    CallButton()
                    logo()
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

struct logo: View {
    var body: some View {
        Image("logoImage")
            .resizable()
            .frame(width: 120, height: 120)
            .scaledToFit()
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
    @State var toMapView = false
    var body: some View {
        Button(action: {
            self.toMapView = true
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
        .sheet(isPresented: $toMapView, content: {
            MapView()
        })
    }
}


#Preview {
    PlayView()
}
