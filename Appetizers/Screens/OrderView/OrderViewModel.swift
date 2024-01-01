//
//  OrderViewModel.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 28/12/23.
//

import Foundation

final class OrderViewModel: ObservableObject {
    
    @Published var orderItems: [Appetizer] = []
    
    var totalPrice: Double {
        
        orderItems.reduce(0) {$0 + $1.price}
        
//        var totalPrice = 0.0
//        
//        for orderItem in orderItems {
//            totalPrice += orderItem.price
//        }
//        
//        return totalPrice
    }
    
    func additems(appetizer: Appetizer) {
        orderItems.append(appetizer)
    }
    
    func deleteItems(atOffsets indexSet: IndexSet) {
        orderItems.remove(atOffsets: indexSet)
    }
    
}
