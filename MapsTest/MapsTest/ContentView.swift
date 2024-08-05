//
//  ContentView.swift
//  MapsTest
//
//  Created by Максим Кузнецов on 05.08.2024.
//

import SwiftUI
import MapKit

struct ContentView: View {
    @State var mapsType: MapsType
    @StateObject private var manager = MapManager()
    
    var body: some View {
        VStack {
            switch mapsType {
            case .yandex:
                YandexMapView() // Карта скроллится дискретно (почему?)
                    .environmentObject(manager)
            case .apple:
                Map() // Карта скроллится плавно
            }
        }
        .sheet(isPresented: Binding.constant(true)) {
            Text(mapsType.rawValue)
                .presentationDetents([.fraction(0.15), .medium])
                .presentationBackgroundInteraction(.enabled)
                .interactiveDismissDisabled()
        }
    }
    
    enum MapsType: String {
        case yandex = "Yandex Maps"
        case apple = "Apple Maps"
    }
}

#Preview {
    ContentView(mapsType: .yandex)
}
