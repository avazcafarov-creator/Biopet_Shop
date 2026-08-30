//
//  PartnerSectionCell.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 29.08.26.
//

import UIKit

class PartnerSectionCell: UICollectionViewCell {
    private lazy var headTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Brendlər"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionTextLabel: UILabel = {
       let label = UILabel()
        label.text = "Mağazamızda 50+ brend mövcuddur."
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
    
    private lazy var petCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.itemSize = CGSize(width: 164, height: 96)

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(PartnerCell.self, forCellWithReuseIdentifier: "PartnerCell")
        cv.dataSource = self
        cv.delegate = self
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var partnerItems: [PartnerModel] = []
    
    override init(frame: CGRect) {
        super .init(frame: frame)
        
        configureConstraints()
    }
    
    //MARK: - Configure Constraints
    private func configureConstraints() {
        addSubview(nextButton)
        addSubview(headTextLabel)
        addSubview(descriptionTextLabel)
        addSubview(petCollectionView)
        
        NSLayoutConstraint.activate([
            nextButton.topAnchor.constraint(equalTo: topAnchor),
            nextButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            headTextLabel.topAnchor.constraint(equalTo: nextButton.topAnchor),
            headTextLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            headTextLabel.trailingAnchor.constraint(equalTo: nextButton.leadingAnchor, constant: -12),
            
            descriptionTextLabel.topAnchor.constraint(equalTo: headTextLabel.bottomAnchor, constant: 4),
            descriptionTextLabel.leadingAnchor.constraint(equalTo: headTextLabel.leadingAnchor),
        
            petCollectionView.topAnchor.constraint(equalTo: descriptionTextLabel.bottomAnchor, constant: 12),
            petCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            petCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            petCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Configure func for data
    func configure(data: [PartnerModel]) {
        partnerItems = data
        petCollectionView.reloadData()
    }
}

//MARK: - PartnerSectionCell: DataSource & Delegate
extension PartnerSectionCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        partnerItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartnerCell", for: indexPath) as! PartnerCell
        cell.configure(with: partnerItems[indexPath.item])
        return cell
    }
}
