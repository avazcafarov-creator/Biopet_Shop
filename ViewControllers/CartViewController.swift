//
//  CartViewController.swift
//  Biopet_Shop
//

import UIKit

class CartViewController: UIViewController {
    private enum CartSection: Int, CaseIterable {
        case header
        case items
        case summary
        case recommended
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Səbət"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let desc = UILabel()
        desc.font = .systemFont(ofSize: 12, weight: .regular)
        desc.textColor = .neuralGray
        desc.translatesAutoresizingMaskIntoConstraints = false
        return desc
    }()
    
    private lazy var emptyStateView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var emptyIconBackground: UIView = {
        let iconBackground = UIView()
        iconBackground.layer.cornerRadius = 24
        iconBackground.backgroundColor = .whiteBiopet
        iconBackground.translatesAutoresizingMaskIntoConstraints = false
        return iconBackground
    }()
    
    private lazy var emptyIconImageView: UIImageView = {
        let icon = UIImageView()
        icon.image = UIImage(named: "bag_filled")?.withRenderingMode(.alwaysTemplate)
        icon.tintColor = .blueBiopet
        icon.contentMode = .scaleAspectFit
        icon.translatesAutoresizingMaskIntoConstraints = false
        return icon
    }()
    
    private lazy var emptyStateLabel: UILabel = {
          let label = UILabel()
          label.text = "Hazırda səbətiniz boşdur."
          label.font = .systemFont(ofSize: 12, weight: .regular)
          label.textColor = .neuralGray
          label.translatesAutoresizingMaskIntoConstraints = false
          return label
      }()

      private lazy var shopButton: UIButton = {
          let button = UIButton()
          button.setTitle("Alış-veriş et", for: .normal)
          button.setTitleColor(.white, for: .normal)
          button.titleLabel?.font = .systemFont(ofSize: 12, weight: .medium)
          button.backgroundColor = .blueBiopet
          button.layer.cornerRadius = 12
          button.translatesAutoresizingMaskIntoConstraints = false
          button.addTarget(self, action: #selector(shopButtonTapped), for: .touchUpInside)
          return button
      }()
    
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 24
        layout.minimumInteritemSpacing = 12

        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(ProductSectionCell.self, forCellWithReuseIdentifier: "ProductSectionCell")
        cv.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "PlaceholderCell")
        cv.dataSource = self
        cv.delegate = self
        cv.showsVerticalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    let viewModel = HomeViewModel()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.updateUI()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        
        CartViewModel.shared.onUpdate = { [weak self] in
            self?.updateUI()
        }
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }
    
    private func configureConstraints() {
        view.addSubview(titleLabel)
        view.addSubview(descriptionLabel)
        view.addSubview(emptyStateView)
        emptyStateView.addSubview(emptyIconBackground)
        emptyIconBackground.addSubview(emptyIconImageView)
        emptyStateView.addSubview(emptyStateLabel)
        emptyStateView.addSubview(shopButton)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),

            descriptionLabel.firstBaselineAnchor.constraint(equalTo: titleLabel.firstBaselineAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 8),
            descriptionLabel.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor, constant: -16),
            
            emptyStateView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyStateView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            emptyStateView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40),
            
            emptyIconBackground.topAnchor.constraint(equalTo: emptyStateView.topAnchor),
            emptyIconBackground.centerXAnchor.constraint(equalTo: emptyStateView.centerXAnchor),
            emptyIconBackground.widthAnchor.constraint(equalToConstant: 96),
            emptyIconBackground.heightAnchor.constraint(equalToConstant: 96),
            
            emptyIconImageView.centerXAnchor.constraint(equalTo: emptyIconBackground.centerXAnchor),
            emptyIconImageView.centerYAnchor.constraint(equalTo: emptyIconBackground.centerYAnchor),
            emptyIconImageView.widthAnchor.constraint(equalToConstant: 48),
            emptyIconImageView.heightAnchor.constraint(equalToConstant: 48),
            
            emptyStateLabel.topAnchor.constraint(equalTo: emptyIconBackground.bottomAnchor, constant: 16),
            emptyStateLabel.centerXAnchor.constraint(equalTo: emptyStateView.centerXAnchor),
            
            shopButton.topAnchor.constraint(equalTo: emptyStateLabel.bottomAnchor, constant: 24),
            shopButton.leadingAnchor.constraint(equalTo: emptyStateView.leadingAnchor),
            shopButton.trailingAnchor.constraint(equalTo: emptyStateView.trailingAnchor),
            shopButton.heightAnchor.constraint(equalToConstant: 40),
            shopButton.bottomAnchor.constraint(equalTo: emptyStateView.bottomAnchor),
            
            collectionView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 24),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc private func shopButtonTapped() {
        tabBarController?.selectedIndex = 0
    }

    private func updateUI() {
        let isEmpty = CartViewModel.shared.items.isEmpty
        emptyStateView.isHidden = !isEmpty
        collectionView.isHidden = isEmpty
        titleLabel.text = "Səbət"
        descriptionLabel.isHidden = isEmpty
        descriptionLabel.text = "\(CartViewModel.shared.items.count) məhsul"
    }
}

extension CartViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        CartSection.allCases.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch CartSection(rawValue: section)! {
        case .header: return 1
        case .items: return CartViewModel.shared.items.count
        case .recommended: return 1
        case .summary: return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch CartSection(rawValue: indexPath.section)! {
            case .recommended:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductSectionCell", for: indexPath) as! ProductSectionCell
            cell.configure(product: viewModel.productItems)
                return cell
            default:
                return collectionView.dequeueReusableCell(withReuseIdentifier: "PlaceholderCell", for: indexPath)
            }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch CartSection(rawValue: indexPath.section)! {
        case .header: return CGSize(width: collectionView.frame.width, height: 40)
        case .items: return CGSize(width: collectionView.frame.width, height: 120)
        case .summary: return CGSize(width: collectionView.frame.width, height: 140)
        case .recommended: return CGSize(width: collectionView.frame.width, height: 368)
        }
    }
}
