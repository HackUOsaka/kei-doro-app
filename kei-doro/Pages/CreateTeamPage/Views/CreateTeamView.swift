//
//  CreateTeamView.swift
//  kei-doro
//
//  Created by saki on 2024/03/13.
//

import SwiftUI
import FirebaseFirestore

struct CreateTeamView: View {
    @EnvironmentObject var timeManager: TimeManager
    
    @ObservedObject var viewModel = CreateTeamViewModel()
//    @State var userId: String
//    @State var gameId: String
//    @State var picktime: String
//    @State var pickOni: String
//    @State var gameMasterName: String
//    @State var gameStart = false
//    @State var users = [String]()
//    @State var names = [String]()
    
    let savedata: UserDefaults = UserDefaults.standard
    let uuid = UUID()
    
    var body: some View {
        let userId = savedata.string(forKey: "userId")
        let gameId = String(uuid.uuidString.prefix(6))

        ZStack{
            Color.backColor
                .ignoresSafeArea()
            VStack {
                HStack{
                    Text("GameID：")
                    Text(gameId)
                }
                .foregroundColor(.white)
                .padding()
                Button(action: {
                    Task {
                        do{
                            try await viewModel.postGameData(gameId: gameId, userId: userId!)
                        } catch {
                            print ()
                        }
                    }
                }, label: {
                    Text("Start")
                })
            }
        }
    }
}
    //        .onAppear(){
    //            Task{
    //                do{
    //                    gameMasterName = try await viewModel.makeIcon()
    //                    userId = try await viewModel.getUserId()
    //                    gameId = try await viewModel.createGameId(userId: userId, name: gameMasterName)
    //                    try await  getUsers(gameId: gameId)
    //                }
    //            }
    //        }
    //
    //        .onChange(of: users){
    //            print("a")
    //        }
    //
    //        .onChange(of: picktime){
    //            Task{
    //                do{
    //                    try await viewModel.saveTime(gameId: gameId, limit: "3")
    //                }
    //            }
    //        }
    //        .onChange(of: pickOni){
    //            Task{
    //                do{
    //                    try await viewModel.saveOni(gameId: gameId, Oni: pickOni)
    //                }
    //            }
    //        }
    //        //ゲームスタートの処理
    //        .onChange(of: gameStart){
    //            Task{
    //                do{
    //                    try await viewModel.startTimer(gameId: gameId)
    //                }
    //            }
    //        }
    //
    //    }
    //
    //    func getUsers(gameId: String)async throws{
    //        var userName = [String]()
    //        let db = Firestore.firestore()
    //
    //        db.collection("games").document(gameId)
    //            .addSnapshotListener { documentSnapshot, error in
    //                guard let document = documentSnapshot else {
    //                    print("Error fetching document: \(error!)")
    //                    return
    //                }
    //                guard let data = document.data() else {
    //                    print("Document data was empty.")
    //                    return
    //                }
    //                let playerIds = data["names"] as![String]
    //                userName = []
    //                users = []
    //                for name in playerIds{
    //                    let index = name.startIndex
    //                    let firstName = String(name[index])
    //                    print(name)
    //                    users.append(firstName)
    //                }
    //                print("Current data: \(userName)")
    //
    //            }
    //
    //    }
    //}

