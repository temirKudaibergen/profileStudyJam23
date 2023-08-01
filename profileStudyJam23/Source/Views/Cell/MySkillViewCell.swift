//
//  ProfileCollectionViewCell.swift
//  profileStudyJam23
//
//  Created by Темирлан Кудайберген on 01.08.2023.
//

import UIKit

final class MySkillViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    private var isEditMode: Bool = true
    static let identifier = "MySkillViewCell"
    
    //    MARK: - UI
    
    private lazy var categoryCellView: UIView = {
        let button = UIView()
        button.backgroundColor = .lightGray
        button.layer.borderColor = .none
        button.layer.cornerRadius = 20
        button.layer.borderWidth = 0.4
        return button
    }()
    
    private lazy var skillsLable: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.backgroundColor = .gray
        label.font = UIFont.systemFont(ofSize: 14)
        label.numberOfLines = 1
        return label
    }()
    
    private lazy var editButton: UIButton = {
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "pencil"), for: .normal)
        button.addTarget(self, action: #selector(editButtonTapped), for: .touchUpInside)
        button.tintColor = .black
        return button
    }()
    
    //    MARK: - obj methods
    
    @objc
    private func editButtonTapped() {
        if isEditMode {
            editButton.setImage(UIImage(named: "pencil"), for: .normal)
        } else {
            editButton.setImage(UIImage(named: "checkMark"), for: .normal)
        }
    }
    
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
        categoryCellView.addSubview(skillsLable)
        addSubview(categoryCellView)
        addSubview(editButton)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            categoryCellView.leadingAnchor.constraint(equalTo: leadingAnchor),
            categoryCellView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        NSLayoutConstraint.activate([
            editButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 335),
            editButton.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    public func configureCell(skills: [String]) {
        skillsLable.text = skills.joined()
    }
    
}
