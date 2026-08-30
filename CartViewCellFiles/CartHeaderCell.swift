//
//  CartHeaderCell.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 30.08.26.
//

import UIKit

class CartHeaderCell: UICollectionViewCell {
    private lazy var checkboxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        button.tintColor = .blueBiopet
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Hamısını seç"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var binButton: UIButton = {
        let button = UIButton()
        button.setImage(.bin, for: .normal)
        button.layer.cornerRadius = 8
        button.backgroundColor = .whiteBiopet
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var itemIndex: Int?
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        addSubview(checkboxButton)
        addSubview(titleLabel)
        addSubview(binButton)
        
        NSLayoutConstraint.activate([
            binButton.topAnchor.constraint(equalTo: topAnchor),
            binButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            binButton.widthAnchor.constraint(equalToConstant: 36),
            binButton.heightAnchor.constraint(equalToConstant: 36),
            
            checkboxButton.centerYAnchor.constraint(equalTo: binButton.centerYAnchor),
            checkboxButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            checkboxButton.heightAnchor.constraint(equalToConstant: 20),
            checkboxButton.widthAnchor.constraint(equalToConstant: 20),
            
            titleLabel.centerYAnchor.constraint(equalTo: checkboxButton.centerYAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: checkboxButton.trailingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: binButton.leadingAnchor, constant: -8),
        ])
    }
    
    @objc private func checkboxTapped() {
        guard let itemIndex else { return }
        checkboxButton.isSelected.toggle()
        CartViewModel.shared.items[itemIndex].isSelected.toggle()
        CartViewModel.shared.onUpdate?()
    }
    
    func configure(with item: CartItem, index: Int) {
        itemIndex = index
        checkboxButton.isSelected = item.isSelected
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
