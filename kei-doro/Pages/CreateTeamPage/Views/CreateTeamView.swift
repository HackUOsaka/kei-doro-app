//
//  CreateTeamView.swift
//  kei-doro
//
//  Created by saki on 2024/03/13.
//

import SwiftUI

struct CreateTeamView: View {
    @ObservedObject var viewModel = CreateTeamViewModel()
    @State var userId: String
    @State var gameId: String
    @State var picktime: String
    @State var pickOni: String
    @State  var gameMasterName: String
    @State var gameStart = false
    let limits = ["10", "15", "20", "25", "30","35", "40", "45", "50", "55","60"]
    let onis = ["1","2","3","4","5"]

    var body: some View {
        VStack{
            HStack{
                Text("ゲームID")
                Text(gameId)
                
            }
            .padding()
            Text(gameMasterName)
                .foregroundColor(.white)
                .frame(width: 50,height: 50)
                .background(Color.mainColor)
                .clipShape(Circle())
                
                .padding()
              
            Form {
                
                Picker("時間を選択", selection: $picktime) {
                    ForEach(limits, id: \.self) { limit in  // データ指定の繰り返し
                        Text(limit + "分")                         // .tag()の指定は不要
                    }
                }
                Picker("鬼の人数を選択", selection: $pickOni) {
                    ForEach(onis, id: \.self) { oni in  // データ指定の繰り返し
                        Text(oni + " 人")                         // .tag()の指定は不要
                    }
                }
            }
            Button(action: {
                gameStart.toggle()
                
            }, label: {
                Text("Start")
            })
        }
        .onAppear(){
            Task{
                do{
                    userId = try await viewModel.getUserId()
                    gameId = try await viewModel.createGameId(userId: userId)
                  gameMasterName =  try await viewModel.makeIcon()
                    
                }
            }
        }
        .onChange(of: picktime){
            Task{
                do{
                    try await viewModel.saveTime(gameId: gameId, limit: picktime)
                }
            }
        }
        .onChange(of: pickOni){
            Task{
                do{
                    try await viewModel.saveOni(gameId: gameId, Oni: pickOni)
                }
            }
        }
        //ゲームスタートの処理
        .onChange(of: gameStart){
            Task{
                do{
                    try await viewModel.startTimer(gameId: gameId)
                }
            }
        }
    }
}

