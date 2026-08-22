//
//  MainViewController.swift
//  Biopet_Shop
//
//  Created by Avaz Cafarov on 11.08.26.
//

import UIKit

class OnboardingViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(OnboardingCell.self, forCellWithReuseIdentifier: "OnboardingCell")
        cv.isPagingEnabled = true
        cv.dataSource = self
        cv.delegate = self
        cv.showsHorizontalScrollIndicator = false
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    private lazy var nextButton: UIButton = {
       let nb = UIButton()
        nb.setTitle("Bildirişlərə icazə ver", for: .normal)
        nb.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        nb.setTitleColor(.white, for: .normal)
        nb.backgroundColor = .init(named: "blue_biopet")
        nb.layer.cornerRadius = 12
        nb.translatesAutoresizingMaskIntoConstraints = false
        nb.addTarget(self, action: #selector(nextButtonTapped), for: .touchUpInside)
        return nb
    }()
    
    private var dismissButton: UIButton = {
        let db = UIButton()
        db.setTitle("İndi yox", for: .normal)
        db.titleLabel?.font = .systemFont(ofSize: 16, weight: .regular)
        db.setTitleColor(.init(named: "neural_gray"), for: .normal)
        db.backgroundColor = .clear
        db.translatesAutoresizingMaskIntoConstraints = false
        return db
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let buttonStackView = UIStackView(arrangedSubviews: [nextButton, dismissButton])
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .fillEqually
        buttonStackView.spacing = 12
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        return buttonStackView
    }()
    
    var items: [OnboardingModel] = [.init(imageName: "notification_onboarding",
                                          title: "🔔 Yenilikləri qaçırmayın",
                                          subtitle: "Bildirişlərə icazə verərək sifarişlərinizin statusu, xüsusi təkliflər və yeniliklərdən xəbərdar olun.",
                                          ),
                                    .init(imageName: "customize",
                                          title: "Fərdiləşdirmə üçün icazə",
                                          subtitle: "Daha yaxşı təcrübə və fərdiləşdirilmiş təkliflər üçün istifadənizi izləməyimizə icazə verin.",
                                          )]
    
    var currentPage = 0 {
        didSet {
            let isLastPage = currentPage == items.count - 1
            let title = isLastPage ? "İzlənməyə icazə ver" : "Bildirişlərə icazə ver"
            nextButton.setTitle(title, for: .normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
    }
    
    private func configureUI() {
        view.backgroundColor = .white
    }
    
    private func configureConstraints() {
        view.addSubview(buttonStackView)
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 180),
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.56),
            collectionView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.92),
            
            buttonStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStackView.topAnchor.constraint(equalTo: collectionView.bottomAnchor, constant: 40),
            buttonStackView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.92),
            buttonStackView.heightAnchor.constraint(equalToConstant: 108)
        ])
    }
    
    @objc func nextButtonTapped() {
        if currentPage == 0 {
            currentPage = 1
            collectionView.scrollToItem(at: IndexPath(item: currentPage, section: 0),
                                        at: .centeredHorizontally,
                                        animated: true)
        } else {
            UserDefaults.standard.set(true, forKey: "hasCompletedOnboarding")
            if let sceneDelegate = UIApplication.shared.connectedScenes.first?.delegate as? SceneDelegate {
                sceneDelegate.showMainScreen()
            }
        }
    }
}

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UIScrollViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCell", for: indexPath) as! OnboardingCell
        cell.configure(with: items[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        print("currentPage: \(currentPage)")
    }
}
