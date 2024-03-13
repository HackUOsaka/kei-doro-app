//
//  HomeView.swift
//  kei-doro
//
//  Created by 布川のぞみ on 2024/03/10.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = HomeViewModel()
    @State var createTeam = false
    @State var JoinTeam = false
    @State var boolGameTeam = true
    @State var errorArart = false
    @State var gameId = ""
    @State var openJoinView = false
    @State var name = ""
    var body: some View {
        
        VStack {
            
            
            NFCView()
            
            Button(action: {
                createTeam.toggle()
            }, label: {
                Text("チーム作成")
            })
            .bold()
            .padding()
            .frame(width: 200, height: 100)
            .foregroundColor(Color.black)
            .background(Color.pink)
            .cornerRadius(10)
            
            Button(action: {
                JoinTeam.toggle()
                
            }, label: {
                Text("チーム参加")
            })
            
            
            
            .bold()
            .padding()
            .frame(width: 200, height: 100)
            .foregroundColor(Color.black)
            .background(Color.mainColor)
            .cornerRadius(10)
            
       
            
            .sheet(isPresented: $createTeam) {
                CreateTeamView(userId: "", gameId: "", picktime: "10", pickOni:  "1", gameMasterName: "")
            }
            
            .alert("ゲームIDを入力", isPresented: $JoinTeam) {
                TextField("ゲームID", text: $gameId)
                
                Button {
                    
                    Task {
                        do{
                           name = try await viewModel.makeIcon()
                            boolGameTeam =  try await viewModel.searchgame(gameId: gameId, name: name)
                            if boolGameTeam == false{
                                errorArart.toggle()
                            }else{
                                openJoinView.toggle()
                            }
                            
                        }
                    }
                    
                } label: {
                    Text("OK")
                }
            }
            .alert("ゲームIDが間違っています", isPresented: $errorArart) {
                Button {
                    
                } label: {
                    Text("OK")
                }
            }
            .sheet(isPresented: $openJoinView){
                JoinTeamView(userId: "", gameId: gameId, time: "", oni: "")
                
            }
        }
        
        
        //
        ////  NavigationLink(destionation: ) {
        //        Text("GAMEに参加する").bold().padding().frame(width: 200, height: 100).foregroundColor(Color.black).background(Color.mainColor).cornerRadius(10)
        //
        
    }
}
#Preview {
    HomeView()
}
