//
//  AppetizersApp.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 25/12/23.
//

import SwiftUI

@main
struct AppetizersApp: App {
    
    @StateObject var orderViewModel = OrderViewModel()
    var body: some Scene {
        WindowGroup {
            AppetizerTabView()
                .environmentObject(orderViewModel)
        }
    }
}
