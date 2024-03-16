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
//     var user: User
     var body: some View {
//        Text(user)
         ZStack {
             Color.backColor
                 .ignoresSafeArea()
             VStack {
                 Spacer()
                     .overlay(
                         VStack{
                             userButton()
                                 .padding(.top, 16)
                             Spacer()
                         }
                     )
                 VStack {
                     Button(action: {
                         createTeam.toggle()
                     }, label: {
                         Text("チーム作成")
                     })
                     .font(.system(size: 20))
                     .foregroundColor(.white)
                     .frame(width: 320, height: 72)
                     .background(Color.secondColor)
                     .cornerRadius(5)
                     .overlay(
                         RoundedRectangle(cornerRadius: 5)
                             .stroke(Color.mainColor, lineWidth: 2))
                     .padding(.bottom, 40)
                     
                     .sheet(isPresented: $createTeam, content: {
                         CreateTeamView()
                             .presentationDetents([.large, .height(400), .fraction(0.5)])
                     })
                     
            
                     Button(action: {
                         JoinTeam.toggle()
                     }, label: {
                         Text("IDを入力")
                     })
                     .font(.system(size: 20))
                     .foregroundColor(.white)
                     .frame(width: 320, height: 72)
                     .background(Color.secondColor)
                     .cornerRadius(5)
                     .overlay(
                         RoundedRectangle(cornerRadius: 5)
                             .stroke(Color.mainColor, lineWidth: 2)
                     )
                     .alert("ゲームIDを入力", isPresented: $JoinTeam) {
                         TextField("ゲームID", text: $gameId)
                         Button {
                             Task {
                                 do{
                                     name = try await  viewModel.makeIcon()
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
                 }
                 Spacer()
             }
      
             .alert("ゲームIDが間違っています", isPresented:  $errorArart) {
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

 struct userButton: View {
     var body: some View {
         Button(action: {
             print()
         }, label: {
             Image(systemName: "person.circle")
                 .font(.system(size: 40))
                 .foregroundColor(Color.secondColor)
                 .frame(width: 320, height: 72, alignment:  .trailing)
         })
     }
 }

#Preview {
    HomeView()
}

