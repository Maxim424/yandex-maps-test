//
//  DetailsViewController.swift
//  MapsTest
//
//  Created by Максим Кузнецов on 11.08.2024.
//

import UIKit
import UIKitPin
import YandexMapsMobile

class DetailsViewController: UIViewController, UIGestureRecognizerDelegate {
    private var manager = MapManager()
    private var mapView: YMKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .green
        mapView = manager.mapView ?? .init()
        view.addSubview(mapView)
        mapView.pin(to: view)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presentBottomSheet()
    }
    
    private func presentBottomSheet() {
        let bottomSheetViewController = BottomSheetViewController()
        let navigationController = UINavigationController(rootViewController: bottomSheetViewController)
        
        navigationController.modalPresentationStyle = .pageSheet
        navigationController.isModalInPresentation = true
        if let sheet = navigationController.sheetPresentationController {
            sheet.detents = [
                .custom(resolver: { context in
                    return 200
                }),
                .medium(),
                .large()
            ]
            sheet.preferredCornerRadius = 20
            sheet.largestUndimmedDetentIdentifier = .medium
        }
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleDimmedAreaTap(_:)))
        tapGestureRecognizer.cancelsTouchesInView = false
        tapGestureRecognizer.delegate = self
        bottomSheetViewController.view.addGestureRecognizer(tapGestureRecognizer)
        
        present(navigationController, animated: true, completion: nil)
    }
    
    @objc func handleDimmedAreaTap(_ sender: UITapGestureRecognizer) {
        // Ничего не делаем, чтобы игнорировать нажатие
    }
    
    // Разрешаем одновременную обработку нескольких распознавателей жестов
    @objc(gestureRecognizer:shouldRecognizeSimultaneouslyWithGestureRecognizer:) func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return true
    }
}
