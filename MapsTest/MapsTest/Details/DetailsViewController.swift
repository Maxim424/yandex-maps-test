//
//  DetailsViewController.swift
//  MapsTest
//
//  Created by Максим Кузнецов on 11.08.2024.
//

import UIKit
import UIKitPin
import YandexMapsMobile

class DetailsViewController: UIViewController {
    private var manager = MapManager()
    private var mapView: YMKMapView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mapView = manager.mapView ?? .init()
        view.addSubview(mapView)
        mapView.pin(to: view)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
    }
}
