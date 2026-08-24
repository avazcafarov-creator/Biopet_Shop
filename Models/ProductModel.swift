//
//  Product.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 16.08.26.
//

import Foundation

struct ProductModel: Codable {
    let category: Category
    let name: String
    let image: String
    let description: String
    let rating: String
    let price: String
    let id: String
}
