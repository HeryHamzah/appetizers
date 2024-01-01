//
//  ContentView.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 25/12/23.
//

import SwiftUI

struct AppetizerTabView: View {
    
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var body: some View {
        TabView {
            AppetizerListView()
                .tabItem { Label("Home", systemImage: "house") }
            
            AccountView()
                .tabItem { Label("Account", systemImage: "person") }
            
            OrderView()
                .tabItem { Label("Order", systemImage: "bag") }
                .badge(orderViewModel.orderItems.count)
        }
        .tint(.brandPrimary)
       
    }
}

#Preview {
    AppetizerTabView()
}
