//
//  ProductCell.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 24.08.26.
//

import UIKit

class ProductCell: UICollectionViewCell {
    private lazy var mainBackground: UIView = {
        let view = UIView()
        view.backgroundColor = .whiteBiopet
        view.layer.cornerRadius = 12
        view.heightAnchor.constraint(equalToConstant: 312).isActive = true
        view.widthAnchor.constraint(equalToConstant: 164).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var productBackground: UIView = {
        let productBackground = UIView()
        productBackground.backgroundColor = .white
        productBackground.layer.cornerRadius = 12
        productBackground.widthAnchor.constraint(equalToConstant: 156).isActive = true
        productBackground.heightAnchor.constraint(equalToConstant: 164).isActive = true
        productBackground.translatesAutoresizingMaskIntoConstraints = false
        return productBackground
    }()
    
    private lazy var heartIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "heart")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .neuralGray
        imageView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var productImage: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.widthAnchor.constraint(equalToConstant: 92).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var productPriceText: UILabel = {
        let productPrice = UILabel()
        productPrice.font = .systemFont(ofSize: 16, weight: .bold)
        productPrice.textColor = .black
        productPrice.translatesAutoresizingMaskIntoConstraints = false
        return productPrice
    }()
    
    private lazy var productNameText: UILabel = {
        let productName = UILabel()
        productName.font = .systemFont(ofSize: 12, weight: .medium)
        productName.textColor = .black
        productName.numberOfLines = 2
        productName.lineBreakMode = .byWordWrapping
        productName.translatesAutoresizingMaskIntoConstraints = false
        return productName
    }()
    
    private lazy var ratingIcon: UIImageView = {
        let ratingIcon = UIImageView()
        ratingIcon.image = UIImage(systemName: "star.filled")?.withRenderingMode(.alwaysTemplate)
        ratingIcon.tintColor = .blueBiopet
        ratingIcon.heightAnchor.constraint(equalToConstant: 12).isActive = true
        ratingIcon.widthAnchor.constraint(equalToConstant: 12).isActive = true
        ratingIcon.translatesAutoresizingMaskIntoConstraints = false
        return ratingIcon
    }()
    
    private lazy var ratingPointText: UILabel = {
        let ratingPoint = UILabel()
        ratingPoint.font = .systemFont(ofSize: 12, weight: .medium)
        ratingPoint.textColor = .blueBiopet
        ratingPoint.translatesAutoresizingMaskIntoConstraints = false
        return ratingPoint
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    private func configure(with: ProductModel) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
