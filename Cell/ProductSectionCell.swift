//
//  ProductSectionCell.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 28.08.26.
//

import UIKit

class ProductSectionCell: UICollectionViewCell {
    private lazy var productCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.itemSize = CGSize(width: 112, height: 124)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var productItems: [ProductModel] = []
    var filteredProducts: [ProductModel] = []
    var discountedProducts: [ProductModel] = []
    
    private func filterDiscountedProducts() {
            discountedProducts = productItems.filter { !$0.discountPercent.isEmpty }
            productCollectionView.reloadData()
        }
}

extension ProductSectionCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        return cell
    }
}

