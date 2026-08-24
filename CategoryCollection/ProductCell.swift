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
    
    private lazy var cartButtonBackground: UIView = {
       let buttonBackground = UIView()
        buttonBackground.backgroundColor = .blueBiopet
        buttonBackground.heightAnchor.constraint(equalToConstant: 32).isActive = true
        buttonBackground.translatesAutoresizingMaskIntoConstraints = false
        return buttonBackground
    }()
    
    private lazy var cartIcon: UIImageView = {
        let cartIcon = UIImageView()
        cartIcon.image = UIImage(systemName: "bag")?.withRenderingMode(.alwaysTemplate)
        cartIcon.tintColor = .white
        cartIcon.heightAnchor.constraint(equalToConstant: 16).isActive = true
        cartIcon.widthAnchor.constraint(equalToConstant: 16).isActive = true
        cartIcon.translatesAutoresizingMaskIntoConstraints = false
        return cartIcon
    }()
    
    private lazy var cartText: UILabel = {
        let cartText = UILabel()
        cartText.font = .systemFont(ofSize: 12, weight: .medium)
        cartText.textColor = .white
        cartText.text = "Səbətə at"
        cartText.translatesAutoresizingMaskIntoConstraints = false
        return cartText
    }()
    
    private lazy var cartTextAndButtonStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [cartText, cartButtonBackground])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var ratingStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [ratingIcon, ratingPointText])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var textAndRatingLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [productPriceText, productNameText, ratingStackView])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 4
        stackView.translatesAutoresizingMaskIntoConstraints = false 
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        addSubview(mainBackground)
        mainBackground.addSubview(productBackground)
        productBackground.addSubview(productImage)
        productBackground.addSubview(heartIcon)
        productBackground.addSubview(textAndRatingLabelStackView)
        productBackground.addSubview(cartButtonBackground)
        cartButtonBackground.addSubview(cartTextAndButtonStackView)
        
        NSLayoutConstraint.activate([
            mainBackground.topAnchor.constraint(equalTo: topAnchor),
            mainBackground.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainBackground.heightAnchor.constraint(equalTo: heightAnchor),
            
            productBackground.topAnchor.constraint(equalTo: mainBackground.topAnchor, constant: 4),
            productBackground.centerXAnchor.constraint(equalTo: mainBackground.centerXAnchor),
            
            productImage.centerXAnchor.constraint(equalTo: productBackground.centerXAnchor),
            productImage.centerYAnchor.constraint(equalTo: productBackground.centerYAnchor),
            
            heartIcon.topAnchor.constraint(equalTo: productBackground.topAnchor, constant: 8),
            heartIcon.trailingAnchor.constraint(equalTo: productBackground.trailingAnchor, constant: 8),
            
            textAndRatingLabelStackView.topAnchor.constraint(equalTo: productBackground.bottomAnchor, constant: 12),
            textAndRatingLabelStackView.leadingAnchor.constraint(equalTo: mainBackground.leadingAnchor, constant: 12),
            textAndRatingLabelStackView.trailingAnchor.constraint(equalTo: mainBackground.trailingAnchor, constant: -12),
            
            cartButtonBackground.topAnchor.constraint(equalTo: textAndRatingLabelStackView.bottomAnchor, constant: 12),
            cartButtonBackground.leadingAnchor.constraint(equalTo: textAndRatingLabelStackView.leadingAnchor),
            cartButtonBackground.trailingAnchor.constraint(equalTo: textAndRatingLabelStackView.trailingAnchor, constant: -12),
        
            cartTextAndButtonStackView.centerYAnchor.constraint(equalTo: cartButtonBackground.centerYAnchor),
            cartTextAndButtonStackView.centerXAnchor.constraint(equalTo: cartButtonBackground.centerXAnchor),
            cartTextAndButtonStackView.bottomAnchor.constraint(equalTo: mainBackground.bottomAnchor, constant: -12),
        ])
    }
    
    func configure(with: ProductModel) {
        productPriceText.text = with.price
        productImage.image = UIImage(named: with.image)
        ratingPointText.text = with.rating
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
