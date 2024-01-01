//
//  Alert.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 27/12/23.
//

import Foundation
import SwiftUI

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
    let alertButton: Alert.Button
}

struct AlertContext {
    //MARK: -Network Alerts
    static let invalidData = AlertItem(title: Text("Server Error"),
                                       message: Text("The data receive from the server was invalid. Please contact support."),
                                       alertButton: .default(Text("OK"))
    )
    static let invalidResponse = AlertItem(title: Text("Server Error"),
                                       message: Text("Invalid response from thre server. Try again later or contact support."),
                                       alertButton: .default(Text("OK"))
    )
    static let invalidURL = AlertItem(title: Text("Server Error"),
                                       message: Text("There was an issue connecting to the server. If this persists, please contact support."),
                                       alertButton: .default(Text("OK"))
    )
    static let unableToComplete = AlertItem(title: Text("Server Error"),
                                       message: Text("Unable to complete your request at this time. Please check your internet connection."),
                                       alertButton: .default(Text("OK"))
    )
    
    //MARK: - Account Alerts
    static let invalidForm = AlertItem(title: Text("Invalid Form"),
                                      message: Text("Please ensure all fields in the form have been filled out."),
                                      alertButton: .default(Text("OK")))
    
    static let invalidEmail = AlertItem(title: Text("Invalid Email"),
                                      message: Text("Please ensure your email is corrent."),
                                      alertButton: .default(Text("OK")))
    
    static let userSaveSuccess  = AlertItem(title: Text("Profile Saved"),
                                                message: Text("Your profile information was successfully saved."),
                                                alertButton: .default(Text("OK")))
        
    static let invalidUserData  = AlertItem(title: Text("Profile Error"),
                                                message: Text("There was an error saving or retrieving your profile."),
                                                alertButton: .default(Text("OK")))
}
