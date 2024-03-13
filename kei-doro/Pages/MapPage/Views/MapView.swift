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
    @State var position: MapCameraPosition = .userLocation(fallback: .automatic)
    @StateObject private var locationManager = LocationManager()
    
    var body: some View {
      //  position = .userLocation(fallback: .automatic)
        Map(position: $position){
      
            
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
        
        
        
        
        
        
    }
    
}
extension CLLocationCoordinate2D {
    static var userLocation: CLLocationCoordinate2D {
        return .init(latitude: 25.7602, longitude: -80.1959)
    }
}
    extension MKCoordinateRegion {
        static var userRegion: MKCoordinateRegion{
            
            return .init(center: .userLocation,
                         latitudinalMeters: 10000,
                         longitudinalMeters: 10000)
        }
    }
    
