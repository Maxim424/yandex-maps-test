//
//  MapsTestApp.swift
//  MapsTest
//
//  Created by Максим Кузнецов on 05.08.2024.
//

import SwiftUI
import YandexMapsMobile

class AppDelegate: NSObject, UIApplicationDelegate {
    let apiKey = "d67cbfc8-2364-4890-a8c7-fe1268a02555"
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        YMKMapKit.setApiKey(apiKey)
        YMKMapKit.sharedInstance()
        return true
    }
}

@main
struct MapsTestApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            DetailsView()
                .ignoresSafeArea(.all)
        }
    }
}
