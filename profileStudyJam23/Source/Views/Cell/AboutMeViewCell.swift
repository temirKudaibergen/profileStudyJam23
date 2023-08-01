//
//  AboutMeViewCell.swift
//  profileStudyJam23
//
//  Created by Темирлан Кудайберген on 01.08.2023.
//

import UIKit

final class AboutMeViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "ProfileCollectionViewCell"
    
    //    MARK: - UI
    
    private let informationLable: UITextField = {
        let textField = UITextField()
        textField.isEnabled = false
        textField.placeholder = "Write about yourself"
        return textField
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
        addSubview(informationLable)
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            informationLable.leadingAnchor.constraint(equalTo: leadingAnchor)
        ])
    }
    
}
