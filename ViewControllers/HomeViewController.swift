////
////  HomeViewController.swift
////  Biopet_Shop
////
////  Created by Avaz Cafarov on 16.08.26.
////
//
//import UIKit
//
//class HomeViewController: UIViewController {
//    private lazy var choosenProductLabelHeadLine: UILabel = {
//        let choosenProductHeadLine = UILabel()
//        choosenProductHeadLine.text = "Seçilmiş məhsullar"
//        choosenProductHeadLine.font = .systemFont(ofSize: 16, weight: .bold)
//        choosenProductHeadLine.textColor = .black
//        choosenProductHeadLine.translatesAutoresizingMaskIntoConstraints = false
//        return choosenProductHeadLine
//    }()
//
//    private lazy var choosenProductLabelDescription: UILabel = {
//        let choosenProductlabelDescription = UILabel()
//        choosenProductlabelDescription.text = "Sizin ev heyvanlarınız üçün"
//        choosenProductlabelDescription.font = .systemFont(ofSize: 12, weight: .regular)
//        choosenProductlabelDescription.textColor = .neuralGray
//        choosenProductlabelDescription.translatesAutoresizingMaskIntoConstraints = false
//        return choosenProductlabelDescription
//    }()
//
//    private lazy var choosenProductTextLabelStackView: UIStackView = {
//        let stackView = UIStackView(arrangedSubviews: [choosenProductLabelHeadLine, choosenProductLabelDescription])
//        stackView.axis = .vertical
//        stackView.spacing = 2
//        stackView.distribution = .fillEqually
//        stackView.alignment = .leading
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private lazy var arrowBackgroundView: UIView = {
//        let arrowBackgroundView = UIView()
//        arrowBackgroundView.backgroundColor = .whiteBiopet
//        arrowBackgroundView.layer.cornerRadius = 8
//        arrowBackgroundView.heightAnchor.constraint(equalToConstant: 36).isActive = true
//        arrowBackgroundView.widthAnchor.constraint(equalToConstant: 36).isActive = true
//        arrowBackgroundView.translatesAutoresizingMaskIntoConstraints = false
//        return arrowBackgroundView
//    }()
//
//    private lazy var arrowIconImageView: UIImageView = {
//        let arrowIconImageView = UIImageView()
//        arrowIconImageView.image = .arrow
//        arrowIconImageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
//        arrowIconImageView.heightAnchor.constraint(equalToConstant: 12).isActive = true
//        arrowIconImageView.translatesAutoresizingMaskIntoConstraints = false
//        return arrowIconImageView
//    }()
//
//    private lazy var petScrollView: UIScrollView = {
//        let scroll = UIScrollView()
//        scroll.showsHorizontalScrollIndicator = false
//        scroll.showsVerticalScrollIndicator = false
//        scroll.translatesAutoresizingMaskIntoConstraints = false
//        return scroll
//    }()
//
//    private lazy var petSelectorBackground: UIView = {
//        let view = UIView()
//        view.backgroundColor = .whiteBiopet
//        view.layer.cornerRadius = 20
//        view.translatesAutoresizingMaskIntoConstraints = false
//        return view
//    }()
//
//    private lazy var petStackView: UIStackView = {
//        let stack = UIStackView()
//        stack.axis = .horizontal
//        stack.spacing = 4
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        return stack
//    }()
//
//    private lazy var petSelectorBackgroundWidthConstraint: NSLayoutConstraint = {
//        let constraint = petSelectorBackground.widthAnchor.constraint(equalTo: petStackView.widthAnchor, constant: 8)
//        constraint.priority = .defaultHigh
//        return constraint
//    }()
//
//    private lazy var productCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 12
//        layout.minimumInteritemSpacing = 12
//        layout.itemSize = CGSize(width: 164, height: 312)
//
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
//        cv.dataSource = self
//        cv.delegate = self
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        return cv
//    }()
//
//    private lazy var discountCollectionView: UICollectionView = {
//        let layout = UICollectionViewFlowLayout()
//        layout.scrollDirection = .horizontal
//        layout.minimumLineSpacing = 12
//        layout.minimumInteritemSpacing = 12
//        layout.itemSize = CGSize(width: 164, height: 312)
//
//        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
//        cv.register(ProductCell.self, forCellWithReuseIdentifier: "ProductCell")
//        cv.dataSource = self
//        cv.delegate = self
//        cv.translatesAutoresizingMaskIntoConstraints = false
//        return cv
//    }()
//
//    var categoryItems: [CategoryModel] = []
//
//    var pets: [Pet] = []
//
//    var allProducts: [ProductModel] = []
//    var filteredProducts: [ProductModel] = []
//    var selectedPetIndex: Int = 0
//
//    var discountedProducts: [ProductModel] = []
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        configureUI()
//        configureConstraints()
//        getCategoryItems()
//        getPetItems()
//        setupPetButtons()
//        getProducts()
//        filterProducts()
//    }
//
//    private func configureUI() {
//        view.backgroundColor = .white
//    }
//
//    private func configureConstraints() {
//        view.addSubview(choosenProductTextLabelStackView)
//        view.addSubview(arrowBackgroundView)
//        arrowBackgroundView.addSubview(arrowIconImageView)
//        view.addSubview(petSelectorBackground)
//        petSelectorBackground.addSubview(petScrollView)
//        petScrollView.addSubview(petStackView)
//        view.addSubview(productCollectionView)
//
//        NSLayoutConstraint.activate([
//            profileIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 68),
//            profileIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
//
//            notificationButton.topAnchor.constraint(equalTo: profileIcon.bottomAnchor, constant: 16),
//            notificationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
//
//            searchBar.topAnchor.constraint(equalTo: notificationButton.topAnchor),
//            searchBar.leadingAnchor.constraint(equalTo: profileIcon.leadingAnchor),
//            searchBar.trailingAnchor.constraint(equalTo: notificationButton.leadingAnchor, constant: -12),
//
//            searchBarImageView.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
//            searchBarImageView.leadingAnchor.constraint(equalTo: searchBar.leadingAnchor, constant: 12),
//
//            searchBarTextField.centerYAnchor.constraint(equalTo: searchBar.centerYAnchor),
//            searchBarTextField.leadingAnchor.constraint(equalTo: searchBarImageView.trailingAnchor, constant: 8),
//
//            categoryCollectionView.leadingAnchor.constraint(equalTo: profileIcon.leadingAnchor),
//            categoryCollectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 12),
//            categoryCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//            categoryCollectionView.heightAnchor.constraint(equalToConstant: 124),
//
//            bannerBackground.leadingAnchor.constraint(equalTo: profileIcon.leadingAnchor),
//            bannerBackground.trailingAnchor.constraint(equalTo: notificationButton.trailingAnchor),
//            bannerBackground.topAnchor.constraint(equalTo: categoryCollectionView.bottomAnchor, constant: 24),
//
//            arrowIconImageView.centerXAnchor.constraint(equalTo: arrowBackgroundView.centerXAnchor),
//            arrowIconImageView.centerYAnchor.constraint(equalTo: arrowBackgroundView.centerYAnchor),
//
//            petSelectorBackground.topAnchor.constraint(equalTo: choosenProductLabelDescription.bottomAnchor, constant: 12),
//            petSelectorBackground.leadingAnchor.constraint(equalTo: profileIcon.leadingAnchor),
//            petSelectorBackground.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -20),
//            petSelectorBackground.heightAnchor.constraint(equalToConstant: 40),
//            petSelectorBackgroundWidthConstraint,
//
//            petScrollView.topAnchor.constraint(equalTo: petSelectorBackground.topAnchor),
//            petScrollView.leadingAnchor.constraint(equalTo: petSelectorBackground.leadingAnchor),
//            petScrollView.trailingAnchor.constraint(equalTo: petSelectorBackground.trailingAnchor),
//            petScrollView.bottomAnchor.constraint(equalTo: petSelectorBackground.bottomAnchor),
//
//            petStackView.topAnchor.constraint(equalTo: petScrollView.topAnchor, constant: 4),
//            petStackView.leadingAnchor.constraint(equalTo: petScrollView.leadingAnchor, constant: 4),
//            petStackView.trailingAnchor.constraint(equalTo: petScrollView.trailingAnchor, constant: -4),
//            petStackView.bottomAnchor.constraint(equalTo: petScrollView.bottomAnchor, constant: -4),
//            petStackView.heightAnchor.constraint(equalTo: petScrollView.heightAnchor, constant: -8),
//
//            productCollectionView.topAnchor.constraint(equalTo: petStackView.bottomAnchor, constant: 12),
//            productCollectionView.leadingAnchor.constraint(equalTo: profileIcon.leadingAnchor),
//            productCollectionView.heightAnchor.constraint(equalToConstant: 312),
//            productCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//        ])
//    }
//
//    @objc private func profileButtonTapped() {
//    }
//
//    private func setupPetButtons() {
//        petStackView.arrangedSubviews.forEach { $0.removeFromSuperview() }
//
//        for (index, pet) in pets.enumerated() {
//            let button = UIButton(type: .system)
//            button.setTitle(pet.name, for: .normal)
//            button.setTitleColor(.black, for: .normal)
//            button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
//            button.tag = index
//            button.addTarget(self, action: #selector(petButtonTapped(_:)), for: .touchUpInside)
//
//            button.backgroundColor = (index == selectedPetIndex) ? .white : .clear
//            button.contentEdgeInsets = UIEdgeInsets(top: 8, left: 12, bottom: 8, right: 12)
//            button.layer.cornerRadius = 16
//            button.clipsToBounds = true
//
//            petStackView.addArrangedSubview(button)
//        }
//    }
//
//    @objc private func petButtonTapped(_ sender: UIButton) {
//        selectedPetIndex = sender.tag
//        setupPetButtons()
//        filterProducts()
//    }
//
//    private func getCategoryItems() {
//        guard let url = Bundle.main.url(forResource: "Category", withExtension: "json") else {return}
//        do {
//            let data = try Data(contentsOf: url)
//                    categoryItems = try JSONDecoder().decode([CategoryModel].self, from: data)
//                    categoryCollectionView.reloadData()
//        } catch {
//            print("== \(error.localizedDescription) ==")
//        }
//    }
//
//    private func filterProducts() {
//        let selectedCategory = pets[selectedPetIndex].category
//        filteredProducts = allProducts.filter { $0.category == selectedCategory }
//        productCollectionView.reloadData()
//    }
//
//    private func getPetItems() {
//        guard let url = Bundle.main.url(forResource: "Pet", withExtension: "json") else {
//            return
//        }
//        do {
//            let data = try Data(contentsOf: url)
//            pets = try JSONDecoder().decode([Pet].self, from: data)
//        } catch {
//            print("== \(error.localizedDescription) ==")
//        }
//    }
//
//    private func getProducts() {
//        guard let url = Bundle.main.url(forResource: "Product", withExtension: "json") else {return}
//        do {
//            let data = try Data(contentsOf: url)
//            allProducts = try JSONDecoder().decode([ProductModel].self, from: data)
//            productCollectionView.reloadData()
//        } catch {
//            print("== \(error.localizedDescription) ==")
//        }
//    }
//
//    private func filterDiscountedProducts() {
//        discountedProducts = allProducts.filter { !$0.discountPercent.isEmpty }
//        discountCollectionView.reloadData()
//    }
//}
//
//extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    }
//
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        if collectionView == categoryCollectionView {
//           return categoryItems.count
//        } else if collectionView == productCollectionView {
//            return filteredProducts.count
//        } else {
//            return pets.count
//        }
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        if collectionView == categoryCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCell", for: indexPath) as! CategoryCell
//            cell.configure(with: categoryItems[indexPath.row])
//            return cell
//        } else if collectionView == productCollectionView {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductCell", for: indexPath) as! ProductCell
//            cell.configure(with: filteredProducts[indexPath.row])
//            return cell
//        } else {
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PetCell", for: indexPath) as! PetCell
//            let isThisSelected = (indexPath.row == selectedPetIndex)
//            cell.configure(name: pets[indexPath.row].name, isSelected: isThisSelected)
//            return cell
//        }
//    }
//}
