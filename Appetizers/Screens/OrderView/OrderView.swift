//
//  OrderView.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 25/12/23.
//

import SwiftUI

struct OrderView: View {
    
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var body: some View {
        NavigationView {
            
            ZStack {
                VStack {
                    List {
                        ForEach(orderViewModel.orderItems) { appetizer in
                            AppetizerListCell(appetizer: appetizer)
                                .listRowSeparator(.hidden)
                        }
                        .onDelete(perform: orderViewModel.deleteItems)
                    }
                    .listStyle(PlainListStyle())
                    
                    if !orderViewModel.orderItems.isEmpty {
                        Button {
                            
                        } label : {
//                            APButton(title: "$\(orderViewModel.totalPrice) - Place Order")
                            Text("$\(orderViewModel.totalPrice.formatted()) - Place Order")
                        }
                        .modifier(StandardButtonStyle())
                        .padding(.bottom, 30)
                    }
                    
                  
                }
                
                if orderViewModel.orderItems.isEmpty {
                        EmptyState(imageName: .emptyOrder,
                                   message: "You have no items in your order")
                }
                
            }
            .navigationTitle("🧾 Orders")
            
        }   
    }
}

#Preview {
    OrderView()
}
