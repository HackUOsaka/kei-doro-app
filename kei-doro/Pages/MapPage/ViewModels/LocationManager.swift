//
//  MapViewModel.swift
//  kei-doro
//
//  Created by saki on 2024/03/13.
//

import CoreLocation
import MapKit

class LocationManager: NSObject, ObservableObject, CLLocationManagerDelegate {
    private var manager = CLLocationManager()
    @Published var lastLocation: CLLocation?
    @Published  var region =  MKCoordinateRegion()

    override init() {
           super.init() // スーパクラスのイニシャライザを実行
           manager.delegate = self // 自身をデリゲートプロパティに設定
           manager.requestWhenInUseAuthorization() // 位置情報を利用許可をリクエスト
           manager.desiredAccuracy = kCLLocationAccuracyBest // 最高精度の位置情報を要求
           manager.distanceFilter = 3.0 // 更新距離(m)
           manager.startUpdatingLocation()
       }

    func startUpdating() {
        self.manager.startUpdatingLocation()
    }

    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {

           // 配列の最後に最新のロケーションが格納される
           // map関数を使って全要素にアクセス map{ $0←要素に参照 }
           locations.last.map {
               let center = CLLocationCoordinate2D(
                   latitude: $0.coordinate.latitude,
                   longitude: $0.coordinate.longitude)

                   // 地図を表示するための領域を再構築
                   region = MKCoordinateRegion(
                       center: center,
                       latitudinalMeters: 1000.0,
                       longitudinalMeters: 1000.0
               )
           }
       }
}
