//
//  MapsTestApp.swift
//  MapsTest
//
//  Created by Максим Кузнецов on 05.08.2024.
//

import SwiftUI
import YandexMapsMobile

class AppDelegate: NSObject, UIApplicationDelegate {
    let apiKey = "" // укажите ваш api key
    
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
            ContentView(mapsType: .yandex) // укажите какую карту хотите использовать.
        }
    }
}
