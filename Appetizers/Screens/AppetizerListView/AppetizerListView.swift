//
//  AppetizerListView.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 25/12/23.
//

import SwiftUI

struct AppetizerListView: View {
    
    @StateObject var appetizerListViewModel = AppetizerListViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                List(appetizerListViewModel.appetizers) { appetizer in
                    AppetizerListCell(appetizer: appetizer)
                        .listRowSeparator(.hidden)
                        .onTapGesture {
                            appetizerListViewModel.selectedAppetizer = appetizer
                        }
                }
                .navigationTitle("🍔 Appetizers")
                .listStyle(.plain)
                .disabled(appetizerListViewModel.isShowDetail)
            }
//            .onAppear {
//                appetizerListViewModel.getAppetizers()
//            }
            .task {
                appetizerListViewModel.getAppetizers()
            }
            .blur(radius: appetizerListViewModel.isShowDetail ? 20 : 0)
            
            if appetizerListViewModel.isShowDetail {
                AppetizerDetailView(appetizer: appetizerListViewModel.selectedAppetizer!, isShowingDetail: $appetizerListViewModel.isShowDetail)
            }
            
            if appetizerListViewModel.isLoading {
                LoadingView()
            }
        }
        
        .alert(item: $appetizerListViewModel.alertItem) { alertItem in
            Alert(title: alertItem.title, message: alertItem.message, dismissButton: alertItem.alertButton)
        }
    }
    
    
}

#Preview {
    AppetizerListView()
}
