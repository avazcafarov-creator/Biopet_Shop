//
//  PartnerCell.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 29.08.26.
//

import UIKit

class PartnerCell: UICollectionViewCell {
    private var rectangleView: UIView = {
        let rv = UIView()
        rv.layer.cornerRadius = 12
        rv.backgroundColor = .white
        rv.widthAnchor.constraint(equalToConstant: 164).isActive = true
        rv.heightAnchor.constraint(equalToConstant: 96).isActive = true
        rv.translatesAutoresizingMaskIntoConstraints = false
        return rv
    }()
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        addSubview(rectangleView)
        addSubview(imageView)
        
        NSLayoutConstraint.activate([
            rectangleView.topAnchor.constraint(equalTo: topAnchor),
            rectangleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            rectangleView.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: rectangleView.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: rectangleView.centerYAnchor),
        ])
    }
    
    func configure(with: PartnerModel) {
        imageView.image = UIImage(named: with.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
