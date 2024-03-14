//
//  HomeView.swift
//  kei-doro
//
//  Created by 布川のぞみ on 2024/03/10.
//

import SwiftUI

struct HomeView: View {
    
    @State var createTeam = false
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

