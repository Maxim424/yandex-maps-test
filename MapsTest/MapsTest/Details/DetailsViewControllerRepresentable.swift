//
//  DetailsViewControllerRepresentable.swift
//  MapsTest
//
//  Created by Максим Кузнецов on 11.08.2024.
//

import SwiftUI
import YandexMapsMobile

struct DetailsView: UIViewControllerRepresentable {    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = DetailsViewController()
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}
