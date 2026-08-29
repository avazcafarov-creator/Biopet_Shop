//
//  BannerSectionCell.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 28.08.26.
//

import UIKit

class BannerSectionCell: UICollectionViewCell {
    private lazy var categoryCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.itemSize = CGSize(width: 112, height: 88)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(BannerCell.self, forCellWithReuseIdentifier: "BannerCell")
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var bannerItems: [BannerCell] = []
    
    
}

extension BannerSectionCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bannerItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        return cell
    }
}
