//
//  APButton.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 28/12/23.
//

import SwiftUI

struct APButton: View {
    
    var title: String
    
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.semibold)
            .foregroundStyle(.white)
            .frame(width: 260, height: 50)
            .background(.brandPrimary)
            .clipShape(RoundedRectangle(cornerRadius: 10))    }
}

#Preview {
    APButton(title: "test title")
}
