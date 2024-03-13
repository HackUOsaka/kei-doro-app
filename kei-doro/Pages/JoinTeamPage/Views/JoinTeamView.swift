//
//  JoinViewModel.swift
//  kei-doro
//
//  Created by saki on 2024/03/13.
//

import SwiftUI
import FirebaseFirestore

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
                    try await getUsers(gameId: gameId)
                  gettime(gameId: gameId)
                }
                catch{
                    print(error)
                }
            }
            
        }
       
    }
    func getUsers(gameId: String)async throws{
        var userName = [String]()
        let db = Firestore.firestore()
        
        db.collection("games").document(gameId)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                let playerIds = data["names"] as![String]
                
                
                print(playerIds)
                
                userName = []
                users = []
                
                for name in playerIds{
                    let index = name.startIndex
                    let firstName = String(name[index])
                    print(name)
                    users.append(firstName)
                }
                
                print("Current data: \(userName)")
                
                
                
                
                
            }
        
    }
    func gettime(gameId: String){
        var userName = [String]()
        let db = Firestore.firestore()
        
        db.collection("games").document(gameId)
            .addSnapshotListener { documentSnapshot, error in
                guard let document = documentSnapshot else {
                    print("Error fetching document: \(error!)")
                    return
                }
                guard let data = document.data() else {
                    print("Document data was empty.")
                    return
                }
                let limit = data["limit"] as! String
                let Oni = data["oni"] as! String
                
              
                
              time = limit
                oni = Oni
                print("Current data: \(userName)")
                  
                
            }
        
    }
}

