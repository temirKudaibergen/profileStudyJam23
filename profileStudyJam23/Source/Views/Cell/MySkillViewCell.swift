//
//  ProfileCollectionViewCell.swift
//  profileStudyJam23
//
//  Created by Темирлан Кудайберген on 01.08.2023.
//

import UIKit

final class MySkillViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "ProfileCollectionViewCell"
    
    //    MARK: - UI
    
    private lazy var skillsLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var deleteButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "pencil"), for: .normal)
        button.tintColor = .red
        return button
    }()
    
    // MARK: Initializers
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Setup
    
    private func setupViews() {
        addSubview(skillsLable)
        addSubview(deleteButton)
    }
    
    private func setupLayout() {
        // констрейнты для skillsLable
        NSLayoutConstraint.activate([
            skillsLable.leadingAnchor.constraint(equalTo: leadingAnchor),
            skillsLable.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        // констрейнты для deleteButton
        NSLayoutConstraint.activate([
            deleteButton.leadingAnchor.constraint(equalTo: skillsLable.trailingAnchor, constant: 8),
            deleteButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            deleteButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            deleteButton.widthAnchor.constraint(equalToConstant: 24),
            deleteButton.heightAnchor.constraint(equalToConstant: 24)
        ])
    }
    
}
