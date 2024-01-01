//
//  EmptyState.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 28/12/23.
//

import SwiftUI

struct EmptyState: View {
    
    var imageName: ImageResource
    var message: String
    
    var body: some View {
        VStack {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 150)
                
            Text(message)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundStyle(.secondary)
                .padding()
        }
        .offset(y: -50)
    }
}

#Preview {
    EmptyState(imageName: .emptyOrder, message: "You have no items in your order")
}
