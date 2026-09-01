//
//  CartSummaryCell.swift
//  Biopet_Shop
//

import UIKit

class CartSummaryCell: UICollectionViewCell {
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .whiteBiopet
        view.layer.cornerRadius = 12
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Yekun"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var productsRow = makeRow()
    private lazy var discountRow = makeRow()
    
    private lazy var divider: UIView = {
        let view = UIView()
        view.backgroundColor = .neuralGray.withAlphaComponent(0.2)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var totalTitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Cəmi"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var totalValueLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .blueBiopet
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var mainStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [titleLabel, productsRow, discountRow, divider, totalRow])
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var totalRow: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [totalTitleLabel, totalValueLabel])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func makeRow() -> UIStackView {
        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 12, weight: .regular)
        titleLabel.textColor = .black
        
        let valueLabel = UILabel()
        valueLabel.font = .systemFont(ofSize: 12, weight: .medium)
        valueLabel.textColor = .black
        valueLabel.textAlignment = .right
        
        let stack = UIStackView(arrangedSubviews: [titleLabel, valueLabel])
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        return stack
    }

    private func configureConstraints() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)

        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),

            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 16),
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -16),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -16),

            divider.heightAnchor.constraint(equalToConstant: 1),
        ])
    }

    func configure(with items: [CartItem]) {
        let count = items.reduce(0) { $0 + $1.quantity }
        let subtotal = items.reduce(0.0) { $0 + (Double($1.product.price) ?? 0) * Double($1.quantity) }
        let oldSubtotal = items.reduce(0.0) { $0 + (Double($1.product.oldPrice) ?? Double($1.product.price) ?? 0) * Double($1.quantity) }
        let discount = max(0, oldSubtotal - subtotal)
        let total = subtotal

        setRow(productsRow, title: "Məhsullar (\(count) ədəd)", value: format(subtotal))
        setRow(discountRow, title: "Endirim", value: "- \(format(discount))")
        totalValueLabel.text = format(total)
    }

    private func setRow(_ row: UIStackView, title: String, value: String) {
        (row.arrangedSubviews[0] as? UILabel)?.text = title
        (row.arrangedSubviews[1] as? UILabel)?.text = value
    }

    private func format(_ value: Double) -> String {
        String(format: "%.2f AZN", value)
    }
}
