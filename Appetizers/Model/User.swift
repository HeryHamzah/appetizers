//
//  User.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 28/12/23.
//

import Foundation

struct User: Codable {
    var firstName = ""
    var lastName = ""
    var email = ""
    var birthDate = Date()
    var extraNapkins = false
    var frequensRefills = false
}
