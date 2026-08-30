//
//  CartViewModel.swift
//  Biopet_Shop
//

import Foundation

final class CartViewModel {
    static let shared = CartViewModel()

    var items: [CartItem] = []

    var onUpdate: (() -> Void)?
}
