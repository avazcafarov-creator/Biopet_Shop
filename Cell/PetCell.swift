//
//  PetCell.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 24.08.26.
//

import UIKit

class PetCell: UICollectionViewCell {
    private lazy var backgroundContainer: UIView = {
        let bc = UIView()
        bc.backgroundColor = .whiteBiopet
        bc.clipsToBounds = true
        bc.translatesAutoresizingMaskIntoConstraints = false
        return bc
    }()
    
    private lazy var petNameLabel: UILabel = {
        let petName = UILabel()
        petName.font = .systemFont(ofSize: 12, weight: .medium)
        petName.textColor = .black
        petName.translatesAutoresizingMaskIntoConstraints = false
        return petName
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
                backgroundContainer.layer.cornerRadius = backgroundContainer.bounds.height / 2
    }
    
    private func configureConstraints() {
        addSubview(backgroundContainer)
        backgroundContainer.addSubview(petNameLabel)
        
        NSLayoutConstraint.activate([
            backgroundContainer.topAnchor.constraint(equalTo: topAnchor),
            backgroundContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundContainer.heightAnchor.constraint(equalTo: heightAnchor),
            backgroundContainer.widthAnchor.constraint(equalTo: petNameLabel.widthAnchor, constant: 16),
        
            petNameLabel.centerYAnchor.constraint(equalTo: backgroundContainer.centerYAnchor),
            petNameLabel.centerXAnchor.constraint(equalTo: backgroundContainer.centerXAnchor),
        ])
    }
    
    func configure(name: String, isSelected: Bool) {
        petNameLabel.text = name
        
        if isSelected {
            backgroundContainer.backgroundColor = .white
            backgroundContainer.layer.shadowOpacity = 0.15
            backgroundContainer.layer.shadowRadius = 4
            backgroundContainer.layer.shadowOffset = CGSize(width: 0, height: 2)
        } else {
            backgroundContainer.backgroundColor = .clear
            backgroundContainer.layer.shadowOpacity = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
