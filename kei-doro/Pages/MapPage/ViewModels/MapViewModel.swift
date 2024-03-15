//
//  MapViewModel.swift
//  kei-doro
//
//  Created by saki on 2024/03/14.
//

import Foundation
import FirebaseFirestore
import MapKit

class MapViewModel: ObservableObject {
    @Published private var locationManager = LocationManager()
    @Published  var location: CLLocation?
    @Published  var region =  MKCoordinateRegion()
    let db = Firestore.firestore()
    
    private var manager = CLLocationManager()
    
    func reloadRegion(gameId: String, userId: String) async throws{
        // オプショナルバインディング
        if let location = manager.location {
            
            let center = CLLocationCoordinate2D(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude)
            
            region = MKCoordinateRegion(
                center: center,
                latitudinalMeters: 1000.0,
                longitudinalMeters: 1000.0
            )
            let geoPoint = GeoPoint(latitude: location.coordinate.latitude, longitude:  location.coordinate.longitude)
            
            try await db.collection("games").document(gameId).collection("players").document(userId).updateData([
                "location": geoPoint
            ])
            
        }
    }
    func setRegion(gameId: String, userId: String) async throws{
        // オプショナルバインディング
        if let location = manager.location {
            
            let center = CLLocationCoordinate2D(
                latitude: location.coordinate.latitude,
                longitude: location.coordinate.longitude)
            
            region = MKCoordinateRegion(
                center: center,
                latitudinalMeters: 1000.0,
                longitudinalMeters: 1000.0
            )
            let geoPoint = GeoPoint(latitude: location.coordinate.latitude, longitude:  location.coordinate.longitude)
            
            try await db.collection("games").document(gameId).collection("players").document(userId).setData([
                "location": geoPoint
            ])
            
        }
    }
    func addlocation(gameId: String)async throws -> Array<MKAnnotation>{
        var annotationArray = [MKAnnotation]()
        let ref =  try await db.collection("games").document(gameId).collection("players").getDocuments()
        for document in ref.documents {
            let data = document.data()
            let location = data["location"]
            let latitude = (location as AnyObject).latitude
            let longitude = (location as AnyObject).longitude
            let coordinate = CLLocationCoordinate2D(latitude: latitude!, longitude: longitude!)
            let annotation = MKPointAnnotation()
            annotation.coordinate = coordinate
            annotationArray.append(annotation)
        }
        return annotationArray
    }
    
    
}
