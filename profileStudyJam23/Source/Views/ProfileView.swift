//
//  ProfileView.swift
//  profileStudyJam23
//
//  Created by Темирлан Кудайберген on 01.08.2023.
//

import UIKit

final class ProfileView: UIView {
    
    //    MARK: - UI
    
    private lazy var userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 150
        imageView.layer.borderWidth = 5
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Bold", size: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var userInformationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "SFProDisplay-Regular", size: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "location")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var userCountryLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: UIFont.Weight(400))
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
        collectionView.register(MySkillViewCell.self,
                                forCellWithReuseIdentifier: MySkillViewCell.identifier)
        collectionView.register(AboutMeViewCell.self,
                                forCellWithReuseIdentifier: AboutMeViewCell.identifier)
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
            // констрейнты для userImageView
            userImageView.topAnchor.constraint(equalTo: topAnchor,
                                               constant: 24),
            userImageView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: 127.5),
            userImageView.widthAnchor.constraint(equalToConstant: 120),
            userImageView.heightAnchor.constraint(equalToConstant: 120),
            // констрейнты для userNameLabel
        ])
        NSLayoutConstraint.activate([
            userNameLabel.topAnchor.constraint(equalTo: userImageView.bottomAnchor,
                                               constant: 16),
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                   constant: 113),
            userNameLabel.widthAnchor.constraint(equalToConstant: 149),
            userNameLabel.heightAnchor.constraint(equalToConstant: 64)
        ])
        // констрейнты для userInformationLabel
        NSLayoutConstraint.activate([
            userInformationLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor,
                                                      constant: 4),
            userInformationLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            userInformationLabel.widthAnchor.constraint(equalToConstant: 273),
            userInformationLabel.heightAnchor.constraint(equalToConstant: 20)
        ])
        // констрейнты для userInformationLabel
        NSLayoutConstraint.activate([
            countryStackView.topAnchor.constraint(equalTo: userInformationLabel.bottomAnchor),
            countryStackView.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                      constant: 150),
            countryStackView.widthAnchor.constraint(equalToConstant: 75),
            countryStackView.heightAnchor.constraint(equalToConstant: 20)
        ])
        // констрейнты для collectionView
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: countryStackView.bottomAnchor,
                                                constant: 40),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
