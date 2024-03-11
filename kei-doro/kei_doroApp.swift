//
//  kei_doroApp.swift
//  kei-doro
//
//  Created by 井上蓮太郎 on 2024/03/05.
//

import SwiftUI
import FirebaseCore

@main
struct kei_doroApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            NFCView(viewModel: NFCViewModel())
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

