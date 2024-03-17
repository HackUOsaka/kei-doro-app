//
//  CreateTeamView.swift
//  kei-doro
//
//  Created by saki on 2024/03/13.
//

import SwiftUI
import FirebaseFirestore

struct CreateTeamView: View {
//    @EnvironmentObject var timeManager: TimeManager
    
    @ObservedObject var viewModel = CreateTeamViewModel()
    @State private var startShow: Bool = false
    @State var showPlayView: Bool = false
    
    let savedata: UserDefaults = UserDefaults.standard
    let uuid = UUID()
    
    var body: some View {
        let userId = savedata.string(forKey: "userId")
        let gameId = String(uuid.uuidString.prefix(6))

        ZStack{
            Color.backColor
                .ignoresSafeArea()
            VStack {
                VStack{
                    Text("GameID：")
                    Text(gameId)
                        .font(.system(size: 32))
                        .padding(.top, 8)
                }
                .foregroundColor(.white)
                .padding()
                Button(action: { startButtonAction()
                }, label: {
                    Text("Start")
                        .font(.system(size: 20))
                        .foregroundStyle(.white)
                        .frame(width: 320, height: 64)
                        .background(Color.secondColor)
                        .overlay(
                            RoundedRectangle(cornerRadius: 4)
                                .stroke(Color.mainColor, lineWidth: 2)
                        )
                })
                .alert("ゲームを始めますか？", isPresented: $startShow) {
                    Button("Cancel", role: .cancel) {}
                    Button("Ok") {
                        self.showPlayView = true
                    }
                }
                .fullScreenCover(isPresented: $showPlayView, content: {
                    PlayView()
                })
            }
        }
    }
    
    private func startButtonAction() {
//        self.showPlayView = true
        startShow.toggle()
        let userId = savedata.string(forKey: "userId")
        let gameId = savedata.string(forKey: "gameId")!
        Task {
            do{
                try await viewModel.postGameData(gameId: gameId, userId: userId!)
            } catch {
                print ()
            }
        }
    }
}


#Preview {
    CreateTeamView()
}

