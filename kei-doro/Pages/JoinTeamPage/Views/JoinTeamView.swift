//
//  JoinViewModel.swift
//  kei-doro
//
//  Created by saki on 2024/03/13.
//

import SwiftUI

struct JoinTeamView: View {
    @ObservedObject var viewModel = JoinTeamViewModel()
    @State var userId: String
    @State var gameId: String
    @State var users = [String]()
    @State var time: String
    @State var oni: String

    var body: some View {
        VStack{
            HStack{
                Text("ゲームID")
                Text(gameId)
                
            }
            .padding()
            HStack{
                ForEach(users, id: \.hashValue){ user in
                    Text(user)
                        .foregroundColor(.white)
                        .frame(width: 50,height: 50)
                        .background(Color.mainColor)
                        .clipShape(Circle())
                    
                        .padding()
                }
            }
            HStack{
                Text("遊ぶ時間")
                Text(time + "分")
            }
            HStack{
                Text("鬼の人数")
                Text(oni + "人")
            }
            
            
        }
        .onAppear(){
            Task{
                do{
                  users = try await viewModel.getUsers(gameId: gameId)
                    time = try await viewModel.getTime(gameId: gameId)
                    oni = try await viewModel.getOni(gameId: gameId)
                }
                catch{
                    print(error)
                }
            }
          
        }
    }
}

