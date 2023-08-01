//
//  HeaderSupplementaryView.swift
//  profileStudyJam23
//
//  Created by Темирлан Кудайберген on 01.08.2023.
//

import UIKit

class HeaderSupplementaryView: UICollectionReusableView {
    
    // MARK: Properties
    
    static let identifier = "HeaderSupplementaryView"
    
    //     MARK: UI
    
     let headerLable: UILabel = {
        let lable = UILabel()
         lable.textColor = .label
         lable.sizeToFit()
         lable.translatesAutoresizingMaskIntoConstraints = false
        lable.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        return lable
    }()
    
    //    MARK: Lifecyle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupLayout()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        headerLable.text = nil
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //    MARK: Setup
    
    func configureHeader(categoryName: String) {
        headerLable.text = categoryName
    }
    
    private func setupViews() {
        addSubview(headerLable)
        clipsToBounds = true
    }
    
    private func setupLayout() {
        NSLayoutConstraint.activate([
            headerLable.topAnchor.constraint(equalTo: self.topAnchor),
            headerLable.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            headerLable.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            headerLable.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -16)
        ])
    }
}
