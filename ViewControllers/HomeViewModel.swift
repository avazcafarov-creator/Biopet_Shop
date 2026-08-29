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
    var partnerItems: [PartnerModel] = []
    var selectedPetIndex: Int = 0
    var discountedItems: [ProductModel] {
        productItems.filter { !$0.discountPercent.isEmpty }
    }
    
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
    
    func getPartners(getPartners: (() -> Void)) {
        guard let url = Bundle.main.url(forResource: "Partner", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: url)
            partnerItems = try JSONDecoder().decode([PartnerModel].self, from: data)
            getPartners()
        } catch {
            print("== \(error.localizedDescription) ==")
        }
    }

    func buildSections() {
        items = []
        if !categoryItems.isEmpty { items.append(.categories) }
        items.append(.banner)
        if !productItems.isEmpty { items.append(.products) }
        if !discountedItems.isEmpty { items.append(.discount) }
        if !partnerItems.isEmpty { items.append(.partners) }

        onUpdate?()
    }
}
