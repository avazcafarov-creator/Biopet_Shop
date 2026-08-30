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
        imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
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
    
    private lazy var discountedPrice: UILabel = {
        let discountedPrice = UILabel()
        discountedPrice.font = .systemFont(ofSize: 16, weight: .bold)
        discountedPrice.textColor = .black
        discountedPrice.translatesAutoresizingMaskIntoConstraints = false
        return discountedPrice
    }()
    
    private lazy var oldPriceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .regular)
        label.textColor = .neuralGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        ratingIcon.image = UIImage(named: "star_filled")?.withRenderingMode(.alwaysTemplate)
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
    
    private lazy var cartButtonBackground: UIButton = {
        let buttonBackground = UIButton()
        buttonBackground.backgroundColor = .blueBiopet
        buttonBackground.layer.cornerRadius = 8
        buttonBackground.heightAnchor.constraint(equalToConstant: 32).isActive = true
        buttonBackground.translatesAutoresizingMaskIntoConstraints = false
        buttonBackground.addTarget(self, action: #selector(addToCartTapped), for: .touchUpInside)
        return buttonBackground
    }()
    
    private lazy var cartIcon: UIImageView = {
        let cartIcon = UIImageView()
        cartIcon.image = UIImage(named: "bag_biopet")?.withRenderingMode(.alwaysTemplate)
        cartIcon.tintColor = .white
        cartIcon.heightAnchor.constraint(equalToConstant: 15).isActive = true
        cartIcon.widthAnchor.constraint(equalToConstant: 13.33).isActive = true
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
        let stackView = UIStackView(arrangedSubviews: [cartIcon, cartText])
        stackView.axis = .horizontal
        stackView.spacing = 4
        stackView.isUserInteractionEnabled = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var discountBadge: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .systemYellow
        label.textAlignment = .center
        label.layer.cornerRadius = 6
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var priceStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productPriceText, oldPriceLabel])
        stack.axis = .horizontal
        stack.spacing = 4
        stack.alignment = .firstBaseline
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private var product: ProductModel?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        addSubview(mainBackground)
        mainBackground.addSubview(productBackground)
        productBackground.addSubview(productImage)
        productBackground.addSubview(heartIcon)
        productBackground.addSubview(discountBadge)
        productBackground.addSubview(priceStackView)
        productBackground.addSubview(productNameText)
        productBackground.addSubview(ratingIcon)
        productBackground.addSubview(ratingPointText)
        mainBackground.addSubview(cartButtonBackground)
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
            heartIcon.trailingAnchor.constraint(equalTo: productBackground.trailingAnchor, constant: -8),
            
            discountBadge.topAnchor.constraint(equalTo: productBackground.topAnchor, constant: 8),
            discountBadge.leadingAnchor.constraint(equalTo: productBackground.leadingAnchor, constant: 8),
            discountBadge.widthAnchor.constraint(equalToConstant: 48),
            discountBadge.heightAnchor.constraint(equalToConstant: 24),
            
            priceStackView.topAnchor.constraint(equalTo: productBackground.bottomAnchor, constant: 4),
            priceStackView.leadingAnchor.constraint(equalTo: productBackground.leadingAnchor, constant: 8),
            
            productNameText.topAnchor.constraint(equalTo: priceStackView.bottomAnchor, constant: 8),
            productNameText.leadingAnchor.constraint(equalTo: priceStackView.leadingAnchor),
            productNameText.trailingAnchor.constraint(equalTo: priceStackView.trailingAnchor),
            
            ratingIcon.topAnchor.constraint(equalTo: productNameText.bottomAnchor, constant: 8),
            ratingIcon.leadingAnchor.constraint(equalTo: productNameText.leadingAnchor),
            
            ratingPointText.topAnchor.constraint(equalTo: ratingIcon.topAnchor),
            ratingPointText.leadingAnchor.constraint(equalTo: ratingIcon.trailingAnchor, constant: 4),
            
            cartButtonBackground.topAnchor.constraint(equalTo: ratingIcon.bottomAnchor, constant: 12),
            cartButtonBackground.leadingAnchor.constraint(equalTo: mainBackground.leadingAnchor, constant: 12),
            cartButtonBackground.trailingAnchor.constraint(equalTo: mainBackground.trailingAnchor, constant: -12),
            cartButtonBackground.bottomAnchor.constraint(equalTo: mainBackground.bottomAnchor, constant: -16),
            
            cartTextAndButtonStackView.centerYAnchor.constraint(equalTo: cartButtonBackground.centerYAnchor),
            cartTextAndButtonStackView.centerXAnchor.constraint(equalTo: cartButtonBackground.centerXAnchor),
            cartTextAndButtonStackView.heightAnchor.constraint(equalToConstant: 16),
        ])
    }
    
    func configure(with product: ProductModel) {
        self.product = product
        productNameText.text = product.name
        productPriceText.text = product.price + " AZN"
        productImage.image = UIImage(named: product.image)
        ratingPointText.text = product.rating
        
        if product.discountPercent.isEmpty && product.oldPrice.isEmpty {
            discountBadge.isHidden = true
            oldPriceLabel.isHidden = true
        } else {
            discountBadge.text = "-\(product.discountPercent)%"
            discountBadge.isHidden = false
            oldPriceLabel.attributedText = NSAttributedString(string: "\(product.oldPrice) AZN", attributes: [.strikethroughStyle: NSUnderlineStyle.single.rawValue,
                                                                                                              .foregroundColor: UIColor.neuralGray] )
            oldPriceLabel.isHidden = false
        }
    }
    
    @objc private func addToCartTapped() {
        guard let product else { return }
           let newItem = CartItem(product: product, quantity: 1, isSelected: true)
           CartViewModel.shared.items.append(newItem)
           CartViewModel.shared.onUpdate?()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
