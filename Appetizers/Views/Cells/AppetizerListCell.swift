//
//  AppetizerListCell.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 25/12/23.
//

import SwiftUI

struct AppetizerListCell: View {
    let appetizer: Appetizer
    
    var body: some View {
        HStack(spacing: 20) {
//            AppetizerRemoteImage(urlString: appetizer.imageURL)
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 120, height: 90)
//                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            AsyncImage(url: URL(string: appetizer.imageURL)) { image in
                image.resizable()
            } placeholder: {
                Image(.foodPlaceholder).resizable()
            }
            .aspectRatio(contentMode: .fit)
            .frame(width: 120, height: 90)
            .clipShape(RoundedRectangle(cornerRadius: 8))
            

            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(2)
                Text("$\(appetizer.price.formatted())")
                    .foregroundStyle(.secondary)
                    .fontWeight(.semibold)
            }
        }
    }
}

#Preview {
    AppetizerListCell(appetizer: MockData.sampleAppetizer)
}
