//
//  CategoryCell.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 21.08.26.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    private var backgroundFrame: UIView = {
        let shape = UIView()
        shape.backgroundColor = .categoryBackground
        shape.layer.cornerRadius = 12
        shape.translatesAutoresizingMaskIntoConstraints = false
        return shape
    }()
    
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var titleText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        addSubview(backgroundFrame)
        addSubview(imageView)
        addSubview(titleText)
        
        NSLayoutConstraint.activate([
            backgroundFrame.topAnchor.constraint(equalTo: topAnchor),
            backgroundFrame.widthAnchor.constraint(equalToConstant: 112),
            backgroundFrame.heightAnchor.constraint(equalToConstant: 96),
            backgroundFrame.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            imageView.centerXAnchor.constraint(equalTo: backgroundFrame.centerXAnchor),
            imageView.bottomAnchor.constraint(equalTo: backgroundFrame.bottomAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 84),
            imageView.widthAnchor.constraint(equalToConstant: 104),
            
            titleText.centerXAnchor.constraint(equalTo: backgroundFrame.centerXAnchor),
            titleText.topAnchor.constraint(equalTo: backgroundFrame.bottomAnchor, constant: 8)
        ])
    }
    
    func configure(with: CategoryModel) {
        titleText.text = with.name
        imageView.image = UIImage(named: with.image)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
