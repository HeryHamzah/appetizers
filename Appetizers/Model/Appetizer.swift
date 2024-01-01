//
//  Appetizer.swift
//  Appetizers
//
//  Created by MD-HeryHamzah on 25/12/23.
//

import Foundation

struct Appetizer : Decodable, Identifiable {
    let id: Int
    let name: String
    let description: String
    let imageURL: String
    let price: Double
    let calories: Int
    let protein: Int
    let carbs: Int
}

struct AppetizerResponse : Decodable {
    let request: [Appetizer]
}

struct MockData {
    
   static let sampleAppetizer = Appetizer(id: 0001,
                                    name: "Title Appetizer Sampe",
                                    description: "This is a description for appetizer sample. Hummmm.. Yummy!",
                                    imageURL: "asian-flank-steak",
                                    price: 9.99,
                                    calories: 99,
                                    protein: 99,
                                    carbs: 99)
    
   static let appetizers = [sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer, sampleAppetizer]
    
    static let orderItemOne = Appetizer(id: 0001,
                                     name: "Title Appetizer Sampe 1",
                                     description: "This is a description for appetizer sample. Hummmm.. Yummy!",
                                     imageURL: "asian-flank-steak",
                                     price: 9.99,
                                     calories: 99,
                                     protein: 99,
                                     carbs: 99)
    
    static let orderItemTwo = Appetizer(id: 0002,
                                     name: "Title Appetizer Sampe 2",
                                     description: "This is a description for appetizer sample. Hummmm.. Yummy!",
                                     imageURL: "asian-flank-steak",
                                     price: 9.99,
                                     calories: 99,
                                     protein: 99,
                                     carbs: 99)
    
    static let orderItemThree = Appetizer(id: 0003,
                                     name: "Title Appetizer Sampe 3",
                                     description: "This is a description for appetizer sample. Hummmm.. Yummy!",
                                     imageURL: "asian-flank-steak",
                                     price: 9.99,
                                     calories: 99,
                                     protein: 99,
                                     carbs: 99)
    
    static let orderItems = [orderItemOne, orderItemTwo, orderItemThree]
}
