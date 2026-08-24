//
//  Product.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 16.08.26.
//

import Foundation

struct Product: Codable {
    let category: Category
    let name: String
    let description: String
    let rating: String
    let price: String
    let id: String
}

enum Category: String, Codable {
    case cat
    case dog
    case bird
    case fish
}

