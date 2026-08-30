//
//  ProductSectionCell.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 28.08.26.
//

import UIKit

class DiscountSectionCell: UICollectionViewCell {
    private lazy var headTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Həftənin endirimləri"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionTextLabel: UILabel = {
       let label = UILabel()
        label.text = "Bütün heyvanlar üçün"
        label.font = UIFont.systemFont(ofSize: 12, weight: .regular)
        label.textColor = .neuralGray
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false 
        return label
    }()
    
    private lazy var nextButton: UIButton = {
        let button = UIButton()
        button.setImage(.arrow, for: .normal)
        button.backgroundColor = .whiteBiopet
        button.layer.cornerRadius = 8
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var productCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.itemSize = CGSize(width: 164, height: 312)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
        cv.dataSource = self
        cv.delegate = self
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var productItems: [ProductModel] = []
    var filteredProducts: [ProductModel] = []
    var discountedProducts: [ProductModel] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    //MARK: - Configure Constraints
    private func configureConstraints() {
        addSubview(nextButton)
        addSubview(headTextLabel)
        addSubview(descriptionTextLabel)
        addSubview(productCollectionView)
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: topAnchor),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            headTextLabel.topAnchor.constraint(equalTo: nextButton.topAnchor),
            headTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headTextLabel.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -12),
            
            descriptionTextLabel.topAnchor.constraint(equalTo: headTextLabel.bottomAnchor, constant: 4),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: headTextLabel.leadingAnchor),
            
            productCollectionView.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: 12),
            productCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            productCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - filtering discounted products
    private func filterDiscountedProducts() {
            discountedProducts = productItems.filter { !$0.discountPercent.isEmpty }
            productCollectionView.reloadData()
        }
    
    //MARK: - Configure func
    func configure(product: [ProductModel]) {
        productItems = product
        filteredProducts = product
        discountedProducts = product.filter { !$0.discountPercent.isEmpty }
        productCollectionView.reloadData()
    }
}

//MARK: - DiscountSectionCell: DataSource && Delegate
extension DiscountSectionCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        productItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
        cell.configure(with: productItems[indexPath.item])
        return cell
    }
}

