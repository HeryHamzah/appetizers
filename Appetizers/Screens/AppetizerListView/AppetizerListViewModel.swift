//
//  AppetizerListViewModel.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 25/12/23.
//

import Foundation

@MainActor final class AppetizerListViewModel: ObservableObject {
    
    @Published var appetizers: [Appetizer] = []
    @Published var alertItem: AlertItem?
    @Published var isLoading = false
    @Published var isShowDetail = false
    
    @Published var selectedAppetizer: Appetizer? {
        didSet {
            isShowDetail = true
        }
    }
    
    //    func getAppetizers() {
    //        isLoading = true
    //        Networkmanager.shared.getAppetizers { result in
    //            DispatchQueue.main.async { [self] in
    //                isLoading = false
    //                switch result {
    //                case .success(let appetizer):
    //                    self.appetizers = appetizer
    //                case .failure(let error):
    //                    switch error {
    //                    case .invalidURL:
    //                        alertItem = AlertContext.invalidURL
    //
    //                    case .invalidResponse:
    //                        alertItem = AlertContext.invalidResponse
    //
    //                    case .invalidData:
    //                        alertItem = AlertContext.invalidData
    //
    //                    case .unableToComplete:
    //                        alertItem = AlertContext.unableToComplete
    //
    //                    }
    //                }
    //            }
    //
    //        }
    //    }
    
    func getAppetizers() {
        
        isLoading = true
        
        Task {
            do {
                appetizers = try await Networkmanager.shared.getAppetizers()
                isLoading = false
            } catch {
                if let apError = error as? APError {
                    switch apError {
                    case .invalidURL:
                        alertItem = AlertContext.invalidURL
                        
                    case .invalidResponse:
                        alertItem = AlertContext.invalidResponse
                        
                    case .invalidData:
                        alertItem = AlertContext.invalidData
                        
                    case .unableToComplete:
                        alertItem = AlertContext.unableToComplete
                        
                    }
                } else {
                    alertItem = AlertContext.invalidResponse
                }
                isLoading = false
            }
        }
    }
}
