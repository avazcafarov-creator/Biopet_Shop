//
//  CartItem.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 30.08.26.
//

import Foundation

struct CartItem: Codable {
    let product: ProductModel
    var quantity: Int
    var isSelected: Bool
}
