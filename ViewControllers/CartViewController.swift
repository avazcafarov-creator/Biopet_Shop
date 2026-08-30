//
//  CartViewController.swift
//  Biopet_Shop
//

import UIKit

class CartViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Səbət"
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
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
        view.addSubview(emptyStateView)
        emptyStateView.addSubview(emptyIconBackground)
        emptyIconBackground.addSubview(emptyIconImageView)
        emptyStateView.addSubview(emptyStateLabel)
        emptyStateView.addSubview(shopButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            
            emptyStateView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            emptyStateView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            emptyStateView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            emptyStateView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            
            emptyIconBackground.topAnchor.constraint(equalTo: emptyStateView.topAnchor),
            emptyIconBackground.centerXAnchor.constraint(equalTo: emptyStateView.centerXAnchor),
            emptyIconBackground.widthAnchor.constraint(equalToConstant: 96),
            emptyIconBackground.heightAnchor.constraint(equalToConstant: 96),
            
            emptyIconImageView.centerXAnchor.constraint(equalTo: emptyIconBackground.centerXAnchor),
            emptyIconImageView.centerYAnchor.constraint(equalTo: emptyIconBackground.centerYAnchor),
            emptyIconImageView.widthAnchor.constraint(equalToConstant: 36),
            emptyIconImageView.heightAnchor.constraint(equalToConstant: 36),
            
            emptyStateLabel.topAnchor.constraint(equalTo: emptyIconBackground.bottomAnchor, constant: 16),
            emptyStateLabel.centerXAnchor.constraint(equalTo: emptyStateView.centerXAnchor),
            
            shopButton.topAnchor.constraint(equalTo: emptyStateLabel.bottomAnchor, constant: 24),
            shopButton.leadingAnchor.constraint(equalTo: emptyStateView.leadingAnchor),
            shopButton.trailingAnchor.constraint(equalTo: emptyStateView.trailingAnchor),
            shopButton.heightAnchor.constraint(equalToConstant: 40),
            shopButton.bottomAnchor.constraint(equalTo: emptyStateView.bottomAnchor)
        ])
    }
    
    @objc private func shopButtonTapped() {
        tabBarController?.selectedIndex = 0
    }

    private func updateUI() {
        let isEmpty = CartViewModel.shared.items.isEmpty
        emptyStateView.isHidden = !isEmpty
        titleLabel.text = isEmpty ? "Səbət" : "Səbət (\(CartViewModel.shared.items.count) məhsul)"
    }
}
