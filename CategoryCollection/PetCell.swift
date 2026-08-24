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
        bc.layer.cornerRadius = 20
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
    
    private lazy var seperator: UILabel = {
        let seperator = UILabel()
        seperator.text = "|"
        seperator.font = .systemFont(ofSize: 12, weight: .medium)
        seperator.textColor = .neuralGray
        seperator.translatesAutoresizingMaskIntoConstraints = false
        return seperator
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        addSubview(backgroundContainer)
        backgroundContainer.addSubview(petNameLabel)
        backgroundContainer.addSubview(seperator)
        
        NSLayoutConstraint.activate([
            backgroundContainer.topAnchor.constraint(equalTo: topAnchor),
            backgroundContainer.leadingAnchor.constraint(equalTo: leadingAnchor),
            backgroundContainer.heightAnchor.constraint(equalTo: heightAnchor),
            
            petNameLabel.centerYAnchor.constraint(equalTo: backgroundContainer.centerYAnchor),
            petNameLabel.centerXAnchor.constraint(equalTo: backgroundContainer.centerXAnchor),
            
            seperator.centerYAnchor.constraint(equalTo: backgroundContainer.centerYAnchor),
            seperator.leadingAnchor.constraint(equalTo: petNameLabel.trailingAnchor, constant: 4),
        ])
    }
    
    func configure(name: String, isSelected: Bool) {
        petNameLabel.text = name
        
        if isSelected {
            backgroundColor = .white
            layer.shadowOpacity = 0.15
        } else {
            backgroundColor = .clear
            layer.shadowOpacity = 0
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
