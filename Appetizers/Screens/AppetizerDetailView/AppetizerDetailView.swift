//
//  AppetizerDetailView.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 27/12/23.
//

import SwiftUI

struct AppetizerDetailView: View {
    
    var appetizer: Appetizer
    @Binding var isShowingDetail: Bool
    @EnvironmentObject var orderViewModel: OrderViewModel
    
    var body: some View {
        VStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .aspectRatio(contentMode: .fit)
                .frame(height: 225)
            
            VStack {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.semibold)
                
                Text(appetizer.description)
                    .multilineTextAlignment(.center)
                    .font(.body)
                    .padding()
                                    
                HStack  {
                    NutritionInfo(title: "Calories", value: "\(appetizer.calories)")
                    NutritionInfo(title: "Carbs", value: "\(appetizer.carbs) g")
                    NutritionInfo(title: "Protein", value: "\(appetizer.protein) g")
                   
                }
            }
            
            Spacer()
            
            Button { 
                orderViewModel.additems(appetizer: appetizer)
                isShowingDetail = false
            } label: {
//                APButton(title: "$\(appetizer.price.formatted()) - Add To Order")
                Text("$\(appetizer.price.formatted()) - Add To Order")
            }
            .modifier(StandardButtonStyle())
//            .standardButtonStyle()
        
            
            Spacer()
        }
        .frame(width: 300, height: 525)
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 12))
        .shadow(radius: 40)
        .overlay(alignment: .topTrailing) {
            Button {
                isShowingDetail = false
            } label : {
                XDismissButton()
            }
        }
    }
}

struct NutritionInfo: View {
    var title: String
    var value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.body)
                .fontWeight(.semibold)
            
            Text(value)
                .font(.body)
                .fontWeight(.semibold)
                .italic()
                .foregroundStyle(.secondary)
        }
        .padding()
    }
}

#Preview {
    AppetizerDetailView(appetizer: MockData.sampleAppetizer, isShowingDetail: .constant(true))
}
