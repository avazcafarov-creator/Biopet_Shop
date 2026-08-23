//
//  HomeViewController.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 16.08.26.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var profileIcon: UIImageView = {
        let profileIcon = UIImageView()
        profileIcon.image = .profileFilled
        profileIcon.heightAnchor.constraint(equalToConstant: 32).isActive = true
        profileIcon.widthAnchor.constraint(equalToConstant: 32).isActive = true
        profileIcon.translatesAutoresizingMaskIntoConstraints = false
        return profileIcon
    }()
    
    private lazy var searchBar: UIView = {
        let searchBar = UIView()
        searchBar.backgroundColor = .whiteBiopet
        searchBar.layer.cornerRadius = 8
        searchBar.heightAnchor.constraint(equalToConstant: 40).isActive = true
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        return searchBar
    }()
    
    private lazy var searchBarImageView: UIImageView = {
        let searchBarImageView = UIImageView()
        searchBarImageView.contentMode = .scaleAspectFit
        searchBarImageView.image = .search
        searchBarImageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        searchBarImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        searchBarImageView.translatesAutoresizingMaskIntoConstraints = false
        return searchBarImageView
    }()
    
    private lazy var searchBarTextField: UITextField = {
        let searchBarTextField = UITextField()
        searchBarTextField.placeholder = "Royal Canin, Sanicat, qurd dərmanı..."
        searchBarTextField.font = .systemFont(ofSize: 12, weight: .regular)
        searchBarTextField.textColor = .neuralGray
        searchBarTextField.translatesAutoresizingMaskIntoConstraints = false
        return searchBarTextField
    }()
    
    private lazy var notificationButton: UIButton = {
        let button = UIButton()
        button.setImage(.notification, for: .normal)
        button.backgroundColor = .whiteBiopet
        button.layer.cornerRadius = 8
        button.widthAnchor.constraint(equalToConstant: 40).isActive = true
        button.heightAnchor.constraint(equalToConstant: 40).isActive = true
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var categoryCollectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        layout.itemSize = CGSize(width: 112, height: 124)
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private lazy var bannerBackground: UIView = {
        let bannerBackground = UIView()
        bannerBackground.backgroundColor = .blueBiopet
        bannerBackground.layer.cornerRadius = 12
        bannerBackground.heightAnchor.constraint(equalToConstant: 88).isActive = true
        bannerBackground.translatesAutoresizingMaskIntoConstraints = false
        return bannerBackground
    }()
    
    private lazy var bannerHeadText: UILabel = {
        let bannerHeadText = UILabel()
        bannerHeadText.text = "Bonus kartınız"
        bannerHeadText.textColor = .white
        bannerHeadText.font = .systemFont(ofSize: 16, weight: .medium)
        bannerHeadText.translatesAutoresizingMaskIntoConstraints = false
        return bannerHeadText
    }()
    
    private lazy var bannerBodyText: UILabel = {
        let bannerBodyText = UILabel()
        bannerBodyText.text = "Barkodu filiallarımızda satıcıya\ntəqdim edin."
        bannerBodyText.textColor = .white
        bannerBodyText.font = .systemFont(ofSize: 12, weight: .regular)
        bannerBodyText.numberOfLines = 2
        bannerBodyText.lineBreakMode = .byWordWrapping
        bannerBodyText.translatesAutoresizingMaskIntoConstraints = false
        return bannerBodyText
    }()
    
    private lazy var qrCodeBackgroundView: UIView = {
        let qrCodeBackgroundView = UIView()
        qrCodeBackgroundView.layer.cornerRadius = 8
        qrCodeBackgroundView.backgroundColor = .blueBiopet
        qrCodeBackgroundView.heightAnchor.constraint(equalToConstant: 56).isActive = true
        qrCodeBackgroundView.widthAnchor.constraint(equalToConstant: 56).isActive = true
        qrCodeBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        return qrCodeBackgroundView
    }()
    
    private lazy var qrCodeImageView: UIImageView = {
        let qrCodeImageView = UIImageView()
        qrCodeImageView.image = UIImage(named: "scan_qr_filled")?
            .withRenderingMode(.alwaysTemplate)
        qrCodeImageView.tintColor = .white
        qrCodeImageView.contentMode = .scaleAspectFit
        qrCodeImageView.heightAnchor.constraint(equalToConstant: 36).isActive = true
        qrCodeImageView.widthAnchor.constraint(equalToConstant: 36).isActive = true
        qrCodeImageView.translatesAutoresizingMaskIntoConstraints = false
        return qrCodeImageView
    }()
    
    var categoryItems: [CategoryModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureConstraints()
        getCategoryItems()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }
    
    private func configureConstraints() {
        view.addSubview(profileIcon)
        view.addSubview(notificationButton)
        view.addSubview(searchBar)
        view.addSubview(searchBarImageView)
        view.addSubview(searchBarTextField)
        view.addSubview(categoryCollectionView)
        view.addSubview(bannerBackground)
        view.addSubview(bannerHeadText)
        view.addSubview(bannerBodyText)
        view.addSubview(qrCodeBackgroundView)
        view.addSubview(qrCodeImageView)
        
        NSLayoutConstraint.activate([
            profileIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 68),
            profileIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            notificationButton.topAnchor.constraint(equalTo: profileIcon.bottomAnchor, constant: 16),
            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            searchBar.topAnchor.constraint(equalTo: notificationButton.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: profileIcon.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: notificationButton.leadingAnchor, constant: -12),
            
            searchBarImageView.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            searchBarImageView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 12),
            
            searchBarTextField.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
            searchBarTextField.leadingAnchor.constraint(equalTo: searchBarImageView.trailingAnchor, constant: 8),
            
            categoryCollectionView.leadingAnchor.constraint(equalTo: profileIcon.leadingAnchor),
            categoryCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12),
            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 124),
            
            bannerBackground.leadingAnchor.constraint(equalTo: profileIcon.leadingAnchor),
            bannerBackground.trailingAnchor.constraint(equalTo: notificationButton.trailingAnchor),
            bannerBackground.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 24),
            
            bannerHeadText.topAnchor.constraint(equalTo: bannerBackground.topAnchor, constant: 16),
            bannerHeadText.leadingAnchor.constraint(equalTo: bannerBackground.leadingAnchor, constant: 16),
            
            bannerBodyText.topAnchor.constraint(equalTo: bannerHeadText.bottomAnchor, constant: 4),
            bannerBodyText.leadingAnchor.constraint(equalTo: bannerHeadText.leadingAnchor),
            
            qrCodeBackgroundView.centerYAnchor.constraint(equalTo: bannerBackground.centerYAnchor),
            qrCodeBackgroundView.trailingAnchor.constraint(equalTo: bannerBackground.trailingAnchor, constant: -16),
            
            qrCodeImageView.centerXAnchor.constraint(equalTo: qrCodeBackgroundView.centerXAnchor),
            qrCodeImageView.centerYAnchor.constraint(equalTo: qrCodeBackgroundView.centerYAnchor),
        ])
    }
    
    @objc private func profileButtonTapped() {
    }
    
    private func getCategoryItems() {
        guard let url = Bundle.main.url(forResource: "Category", withExtension: "json") else {return}
        do {
            let data = try Data(contentsOf: url)
                    categoryItems = try JSONDecoder().decode([CategoryModel].self, from: data)
                    categoryCollectionView.reloadData()
        } catch {
            print("== \(error.localizedDescription) ==")
        }
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
        cell.configure(with: categoryItems[indexPath.row])
        return cell
    }
}
