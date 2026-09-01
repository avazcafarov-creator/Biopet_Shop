//
//  HomeController.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 25.08.26.
//

import UIKit

class HomeController: UIViewController {
    enum HomeSection: Int, CaseIterable {
        case categories
        case banner
        case products
        case discount
        case partners
    }

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
    
    //MARK: - collectionView (vertical)
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
         layout.scrollDirection = .vertical
         layout.minimumLineSpacing = 24
         layout.minimumInteritemSpacing = 12

         let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
         cv.register(CategorySectionCell.self, forCellWithReuseIdentifier: "CategorySectionCell")
         cv.register(BannerCell.self, forCellWithReuseIdentifier: "BannerCell")
         cv.register(ProductSectionCell.self, forCellWithReuseIdentifier: "ProductSectionCell")
         cv.register(PartnerSectionCell.self, forCellWithReuseIdentifier: "PartnerSectionCell")
         cv.dataSource = self
         cv.delegate = self
         cv.showsVerticalScrollIndicator = false
         cv.translatesAutoresizingMaskIntoConstraints = false
         return cv
    }()
    
    let viewModel = HomeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        configureConstraints()
    }
    //MARK: - Configure Constraints
    private func configureConstraints() {
        view.addSubview(profileIcon)
        view.addSubview(notificationButton)
        view.addSubview(searchBar)
        searchBar.addSubview(searchBarImageView)
        searchBar.addSubview(searchBarTextField)
        view.addSubview(collectionView)
        
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
            
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: notificationButton.trailingAnchor),
        ])
        
        viewModel.getCategoryItems {
            self.viewModel.getProducts {
                self.viewModel.getPartners {
                    self.viewModel.buildSections()
                }
            }
        }

        viewModel.onUpdate = {
            self.collectionView.reloadData()
        }
    }
}
//MARK: - UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout
extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch viewModel.items[indexPath.item] {
        case .categories:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategorySectionCell", for: indexPath) as! CategorySectionCell
            cell.configure(data: viewModel.categoryItems)
            return cell
        case .banner:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
            return cell
        case .products:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSectionCell", for: indexPath) as! ProductSectionCell
            cell.configure(product: viewModel.productItems)
            return cell
        case .discount:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSectionCell", for: indexPath) as! ProductSectionCell
            cell.configure(product: viewModel.discountedItems)
            return cell
        case .partners:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PartnerSectionCell", for: indexPath) as! PartnerSectionCell
            cell.configure(data: viewModel.partnerItems)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch viewModel.items[indexPath.item] {
        case .categories: return CGSize(width: collectionView.frame.width, height: 124)
        case .banner: return CGSize(width: collectionView.frame.width, height: 88)
        case .products:   return CGSize(width: collectionView.frame.width, height: 368)
        case .discount:   return CGSize(width: collectionView.frame.width, height: 368)
        case .partners: return CGSize(width: collectionView.frame.width, height: 152)
        }
    }
}

