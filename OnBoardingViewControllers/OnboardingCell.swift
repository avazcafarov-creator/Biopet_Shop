//
//  NotificationCollectionViewCell.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 18.08.26.
//

import UIKit

class OnboardingCell: UICollectionViewCell {
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.textColor = .black
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        return titleLabel
    }()
    
    private var descriptionLabel: UILabel = {
        let dl = UILabel()
        dl.font = .systemFont(ofSize: 12, weight: .regular)
        dl.textColor = .init(named: "neural_gray")
        dl.textAlignment = .center
        dl.numberOfLines = 2
        dl.translatesAutoresizingMaskIntoConstraints = false
        return dl
    }()
    
    private lazy var textStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [titleLabel, descriptionLabel])
        sv.axis = .vertical
        sv.spacing = 12
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
       addSubview(imageView)
       addSubview(textStackView)
        
       NSLayoutConstraint.activate([
        textStackView.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 72),
        textStackView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.77),
        textStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        textStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
        
        imageView.topAnchor.constraint(equalTo: topAnchor),
        imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
        imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
        imageView.bottomAnchor.constraint(equalTo: textStackView.topAnchor, constant: -72),
       ])
    }
    
    func configure(with: OnboardingModel) {
        imageView.image = UIImage(named: with.imageName)
        titleLabel.text = with.title
        descriptionLabel.text = with.subtitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
