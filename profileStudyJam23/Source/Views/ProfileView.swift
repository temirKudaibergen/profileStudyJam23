//
//  ProfileView.swift
//  profileStudyJam23
//
//  Created by Темирлан Кудайберген on 01.08.2023.
//

import UIKit

final class ProfileView: UIView {
    
    //    MARK: - Properties

    let sections = MockData.shared.pageData
    
    //    MARK: - UI
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 50
        imageView.image = UIImage(named: "Man")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 24)
        label.numberOfLines = 2
        label.textAlignment = .center
        label.text = "Кудайберген Темирлан Талгатович"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userInformationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        label.text = "Middle iOS-разработчик, опыт более 2-х лет"
        label.numberOfLines = 2
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        imageView.widthAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.heightAnchor.constraint(equalToConstant: 16).isActive = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var userCountryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 13)
        label.text = "Астана"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var countryStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.distribution = .equalSpacing
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .none
        collectionView.bounces = true
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MySkillViewCell.self,
                                forCellWithReuseIdentifier: MySkillViewCell.identifier)
        collectionView.register(AboutMeViewCell.self,
                                forCellWithReuseIdentifier: AboutMeViewCell.identifier)
        collectionView.register(HeaderSupplementaryView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: HeaderSupplementaryView.identifier)
        collectionView.collectionViewLayout = createLayout()
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    
    
    //    MARK: Initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: Setup
    
    private func setupHierarchy() {
        addSubview(userImageView)
        addSubview(userNameLabel)
        addSubview(userInformationLabel)
        addSubview(countryStackView)
        countryStackView.addArrangedSubview(locationImageView)
        countryStackView.addArrangedSubview(userCountryLabel)
        addSubview(collectionView)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            userImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor,
                                               constant: 42),
            userImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            userImageView.widthAnchor.constraint(equalToConstant: 120),
            userImageView.heightAnchor.constraint(equalToConstant: 120),
        ])
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor,
                                               constant: 16),
            userNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            userNameLabel.widthAnchor.constraint(equalToConstant: 250),
            userNameLabel.heightAnchor.constraint(equalToConstant: 64)
        ])
        NSLayoutConstraint.activate([
            userInformationLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor,
                                                      constant: 4),
            userInformationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            userInformationLabel.widthAnchor.constraint(equalToConstant: 400)
        ])
        NSLayoutConstraint.activate([
            countryStackView.topAnchor.constraint(equalTo: userInformationLabel.bottomAnchor),
            countryStackView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                      constant: 150),
            countryStackView.widthAnchor.constraint(equalToConstant: 80),
            countryStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: countryStackView.bottomAnchor,
                                                constant: 40),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
