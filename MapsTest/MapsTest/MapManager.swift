//
//  MapManager.swift
//  MapsTest
//
//  Created by Максим Кузнецов on 05.08.2024.
//

import Foundation
import CoreLocation
import YandexMapsMobile

class MapManager: NSObject, CLLocationManagerDelegate, ObservableObject {
    private let manager = CLLocationManager()
    let mapView = YMKMapView(frame: CGRect.zero)
    
    lazy var map : YMKMap = {
        return mapView?.mapWindow.map ?? .init()
    }()
}

