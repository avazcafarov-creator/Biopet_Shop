//
//  HomeViewModel.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 28.08.26.
//

import Foundation

final class HomeViewModel {
    var items: [HomeController.HomeSection] = []
    var categoryItems: [CategoryModel] = []
    var petItems: [Pet] = []
    var productItems: [ProductModel] = []

    var onUpdate: (() -> Void)?

    func getCategoryItems(completion: (() -> Void)) {
        guard let url = Bundle.main.url(forResource: "Category", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: url)
            categoryItems = try JSONDecoder().decode([CategoryModel].self, from: data)
//            onUpdate?()
            completion()
        } catch {
            print("== \(error.localizedDescription) ==")
        }
    }
    
    func buildSections() {
        items = []
        if !categoryItems.isEmpty { items.append(.categories) }
        items.append(.banner)
        if !petItems.isEmpty { items.append(.petFilter) }
        if !productItems.isEmpty { items.append(.products) }

        onUpdate?()
    }
}
