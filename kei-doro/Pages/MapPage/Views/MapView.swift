//
//  MapView.swift
//  kei-doro
//
//  Created by saki on 2024/03/13.
//

import SwiftUI
import MapKit
import CoreLocation


struct MapView: View {
    @Namespace var mapScope
    @StateObject var viewModel = MapViewModel()
    @State var position: MapCameraPosition = .userLocation(fallback: .automatic)
    let  manager = CLLocationManager()
    @ObservedObject var locationManager = LocationManager()
    @State private var region = MKCoordinateRegion()
    
    var savedata: UserDefaults = UserDefaults.standard
    @State  var annotationArray = [MKAnnotation]()
    @State private var customAnnotations: [CustomAnnotation] = []
    
    
    
    
    var body: some View {
        
        Map(position: $position) {
            ForEach(customAnnotations) { customAnnotation in
                Marker("", coordinate: customAnnotation.annotation.coordinate)
                    .tint(.blue)
            }
            UserAnnotation()
        }
        
        .mapControls {
            MapPitchToggle()
            MapUserLocationButton()
        }
        .mapStyle(.standard(elevation: .realistic))
        .mapScope(mapScope)
        .onAppear {
            locationManager.startUpdating()
        }
        Button(action: {
            
            
            
        }, label: {
            Text("位置情報更新")
        })
        .onAppear(){
            let UserId = savedata.object(forKey: "UserId")
            let gameId = savedata.object(forKey: "GameId")
            Task{
                do{
                    try await viewModel.setRegion(gameId: gameId as! String, userId: UserId as! String)
                }
            }
            var timer = Timer()
            timer = Timer.scheduledTimer(withTimeInterval: 180.0, repeats: true, block: { (timer) in
                
                Task{
                    do{
                        customAnnotations = []
                        try await  viewModel.reloadRegion(gameId: gameId as! String, userId: UserId as! String)
                        annotationArray = try await viewModel.addlocation(gameId: gameId as! String)
                        //anotation全部消す
                        for annotation in annotationArray {
                            customAnnotations.append(CustomAnnotation(annotation: annotation))
                        }
                        
                        
                    }
                }
            })
            //    gameId = try await viewModel.createGameId(userId: userId, name: gameMasterName)
        }
        
    }
    
}

struct CustomAnnotation: Identifiable {
    let id = UUID()
    let annotation: MKAnnotation
}
