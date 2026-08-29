//
//  BannerCell.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 28.08.26.
//

import UIKit

class BannerCell: UICollectionViewCell {
    private lazy var bannerBackground: UIView = {
        let bannerBackground = UIView()
        bannerBackground.backgroundColor = .blueBiopet
        bannerBackground.clipsToBounds = true
        bannerBackground.layer.cornerRadius = 12
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
    
    private lazy var heartIconBannerBackground: UIImageView = {
        let heartIcon = UIImageView()
        heartIcon.image = UIImage(named: "favorite_filled")?.withRenderingMode(.alwaysTemplate)
        heartIcon.tintColor = .blueDark
        heartIcon.contentMode = .scaleAspectFit
        heartIcon.heightAnchor.constraint(equalToConstant: 20).isActive = true
        heartIcon.widthAnchor.constraint(equalToConstant: 24).isActive = true
        heartIcon.transform = CGAffineTransform(rotationAngle: .pi / 5)
        heartIcon.translatesAutoresizingMaskIntoConstraints = false
        return heartIcon
    }()

    private lazy var cloudIconBannerBackground: UIImageView = {
        let cloudIcon = UIImageView()
        cloudIcon.image = UIImage(named: "cloud_filled")?.withRenderingMode(.alwaysTemplate)
        cloudIcon.tintColor = .blueDark
        cloudIcon.contentMode = .scaleAspectFit
        cloudIcon.translatesAutoresizingMaskIntoConstraints = false
        return cloudIcon
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureConstraints()
    }
    
    private func configureConstraints() {
        addSubview(bannerBackground)
        bannerBackground.addSubview(cloudIconBannerBackground)
        bannerBackground.addSubview(heartIconBannerBackground)
        bannerBackground.addSubview(bannerHeadText)
        bannerBackground.addSubview(bannerBodyText)
        bannerBackground.addSubview(qrCodeBackgroundView)
        qrCodeBackgroundView.addSubview(qrCodeImageView)
        
        NSLayoutConstraint.activate([
            bannerBackground.topAnchor.constraint(equalTo: topAnchor),
            bannerBackground.widthAnchor.constraint(equalTo: widthAnchor),
            bannerBackground.heightAnchor.constraint(equalTo: heightAnchor),
            
            heartIconBannerBackground.topAnchor.constraint(equalTo: bannerBackground.topAnchor, constant: 12),
            heartIconBannerBackground.leadingAnchor.constraint(equalTo: bannerBackground.leadingAnchor, constant: 112),

            cloudIconBannerBackground.bottomAnchor.constraint(equalTo: bannerBackground.bottomAnchor),
            cloudIconBannerBackground.topAnchor.constraint(equalTo: bannerBackground.topAnchor),
            cloudIconBannerBackground.trailingAnchor.constraint(equalTo: bannerBackground.trailingAnchor),

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
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
