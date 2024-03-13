//
//  MapViewModel.swift
//  kei-doro
//
//  Created by saki on 2024/03/13.
//

import CoreLocation

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var internalLocationManager = CLLocationManager()
    @Published var lastLocation: CLLocation?

    override init() {
        super.init()
        self.internalLocationManager.delegate = self
        self.internalLocationManager.requestWhenInUseAuthorization()
    }

    func startUpdating() {
        self.internalLocationManager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        self.lastLocation = locations.last
    }
}
