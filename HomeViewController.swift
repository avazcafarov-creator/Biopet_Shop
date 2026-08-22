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
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 12
        layout.minimumInteritemSpacing = 12
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(CategoryCell.self, forCellWithReuseIdentifier: "CategoryCell")
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var categoryItems: [CategoryModel] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
        configureConstraints()
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
            categoryCollectionView.bottomAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12),
            categoryCollectionView.heightAnchor.constraint(equalToConstant: 124),
        ])
    }
    
    @objc private func profileButtonTapped() {
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
