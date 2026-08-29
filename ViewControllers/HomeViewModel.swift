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
    var filteredProducts: [ProductModel] = []
    var selectedPetIndex: Int = 0
    
    var onUpdate: (() -> Void)?
    
    func getCategoryItems(completion: (() -> Void)) {
        guard let url = Bundle.main.url(forResource: "Category", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: url)
            categoryItems = try JSONDecoder().decode([CategoryModel].self, from: data)
            completion()
        } catch {
            print("== \(error.localizedDescription) ==")
        }
    }
    
    func filterProducts(filterProducts: (() -> Void)) {
        let selectedCategory = petItems[selectedPetIndex].category
        filteredProducts = productItems.filter { $0.category == selectedCategory }
        filterProducts()
    }
    
    func getProducts(getProducts: (() -> Void)) {
        guard let url = Bundle.main.url(forResource: "Product", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: url)
            productItems = try JSONDecoder().decode([ProductModel].self, from: data)
            getProducts()
        } catch {
            print("== \(error.localizedDescription) ==")
        }
    }

    func buildSections() {
        items = []
        if !categoryItems.isEmpty { items.append(.categories) }
        items.append(.banner)
        if !productItems.isEmpty { items.append(.products) }

        onUpdate?()
    }
}
