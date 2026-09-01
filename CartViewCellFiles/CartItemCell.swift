//
//  CartItemCell.swift
//  Biopet_Shop
//

import UIKit

class CartItemCell: UICollectionViewCell {
    private lazy var productImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFit
        iv.backgroundColor = .whiteBiopet
        iv.layer.cornerRadius = 12
        iv.clipsToBounds = true
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()

    private lazy var bonusLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textColor = .black
        label.backgroundColor = .systemYellow
        label.textAlignment = .center
        label.layer.cornerRadius = 6
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var checkboxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "square"), for: .normal)
        button.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        button.tintColor = .blueBiopet
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(checkboxTapped), for: .touchUpInside)
        return button
    }()

    private lazy var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var fastBadgeLabel: PaddingLabel = {
        let label = PaddingLabel()
        label.textInsets = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        label.text = "Sürətli"
        label.font = .systemFont(ofSize: 12, weight: .medium)
        label.textColor = .blueBiopet
        label.backgroundColor = .whiteBiopet
        label.textAlignment = .center
        label.layer.cornerRadius = 4
        label.clipsToBounds = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 13, weight: .regular)
        label.textColor = .black
        label.numberOfLines = 2
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var packagingLabel: UILabel = {
        let label = UILabel()
        label.text = "Qablaşdırma: 1 kq"
        label.font = .systemFont(ofSize: 11, weight: .regular)
        label.textColor = .neuralGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var minusButton: UIButton = {
        let button = UIButton()
        button.setTitle("−", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .whiteBiopet
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(minusTapped), for: .touchUpInside)
        return button
    }()

    private lazy var quantityLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var plusButton: UIButton = {
        let button = UIButton()
        button.setTitle("+", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.backgroundColor = .whiteBiopet
        button.layer.cornerRadius = 6
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(plusTapped), for: .touchUpInside)
        return button
    }()

    private lazy var stepperStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [minusButton, quantityLabel, plusButton])
        stack.axis = .horizontal
        stack.spacing = 10
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private lazy var heartButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .neuralGray
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    private lazy var trashButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "trash"), for: .normal)
        button.tintColor = .neuralGray
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(trashTapped), for: .touchUpInside)
        return button
    }()

    private lazy var bottomRowStackView: UIStackView = {
        let spacer = UIView()
        let stack = UIStackView(arrangedSubviews: [stepperStackView, spacer, heartButton, trashButton])
        stack.axis = .horizontal
        stack.spacing = 16
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    private var itemIndex: Int?

    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func configureConstraints() {
        addSubview(productImageView)
        productImageView.addSubview(bonusLabel)
        addSubview(checkboxButton)
        addSubview(priceLabel)
        addSubview(fastBadgeLabel)
        addSubview(nameLabel)
        addSubview(packagingLabel)
        addSubview(bottomRowStackView)

        NSLayoutConstraint.activate([
            productImageView.topAnchor.constraint(equalTo: topAnchor),
            productImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            productImageView.widthAnchor.constraint(equalToConstant: 88),
            productImageView.heightAnchor.constraint(equalToConstant: 88),

            bonusLabel.leadingAnchor.constraint(equalTo: productImageView.leadingAnchor, constant: 4),
            bonusLabel.bottomAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: -4),
            bonusLabel.widthAnchor.constraint(equalToConstant: 44),
            bonusLabel.heightAnchor.constraint(equalToConstant: 18),

            checkboxButton.topAnchor.constraint(equalTo: topAnchor),
            checkboxButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            checkboxButton.widthAnchor.constraint(equalToConstant: 20),
            checkboxButton.heightAnchor.constraint(equalToConstant: 20),

            priceLabel.topAnchor.constraint(equalTo: topAnchor),
            priceLabel.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 12),

            fastBadgeLabel.centerYAnchor.constraint(equalTo: priceLabel.centerYAnchor),
            fastBadgeLabel.leadingAnchor.constraint(equalTo: priceLabel.trailingAnchor, constant: 8),
            fastBadgeLabel.trailingAnchor.constraint(lessThanOrEqualTo: checkboxButton.leadingAnchor, constant: -8),

            nameLabel.topAnchor.constraint(equalTo: priceLabel.bottomAnchor, constant: 6),
            nameLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),

            packagingLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            packagingLabel.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),

            bottomRowStackView.topAnchor.constraint(equalTo: packagingLabel.bottomAnchor, constant: 10),
            bottomRowStackView.leadingAnchor.constraint(equalTo: priceLabel.leadingAnchor),
            bottomRowStackView.trailingAnchor.constraint(equalTo: trailingAnchor),

            minusButton.widthAnchor.constraint(equalToConstant: 24),
            minusButton.heightAnchor.constraint(equalToConstant: 24),
            plusButton.widthAnchor.constraint(equalToConstant: 24),
            plusButton.heightAnchor.constraint(equalToConstant: 24),
            quantityLabel.widthAnchor.constraint(equalToConstant: 18),

            heartButton.widthAnchor.constraint(equalToConstant: 20),
            heartButton.heightAnchor.constraint(equalToConstant: 20),
            trashButton.widthAnchor.constraint(equalToConstant: 20),
            trashButton.heightAnchor.constraint(equalToConstant: 20),
        ])
    }

    func configure(with item: CartItem, index: Int) {
        itemIndex = index
        checkboxButton.isSelected = item.isSelected
        productImageView.image = UIImage(named: item.product.image)
        priceLabel.text = item.product.price + " AZN"
        nameLabel.text = item.product.name
        quantityLabel.text = "\(item.quantity)"
        bonusLabel.text = "+\(item.quantity * 4) AZN"
    }

    @objc private func checkboxTapped() {
        guard let itemIndex else { return }
        checkboxButton.isSelected.toggle()
        CartViewModel.shared.items[itemIndex].isSelected.toggle()
        CartViewModel.shared.onUpdate?()
    }

    @objc private func minusTapped() {
        guard let itemIndex, CartViewModel.shared.items[itemIndex].quantity > 1 else { return }
        CartViewModel.shared.items[itemIndex].quantity -= 1
        CartViewModel.shared.onUpdate?()
    }

    @objc private func plusTapped() {
        guard let itemIndex else { return }
        CartViewModel.shared.items[itemIndex].quantity += 1
        CartViewModel.shared.onUpdate?()
    }

    @objc private func trashTapped() {
        guard let itemIndex else { return }
        CartViewModel.shared.items.remove(at: itemIndex)
        CartViewModel.shared.onUpdate?()
    }
}
