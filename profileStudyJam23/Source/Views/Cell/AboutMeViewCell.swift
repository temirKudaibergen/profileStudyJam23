//
//  AboutMeViewCell.swift
//  profileStudyJam23
//
//  Created by Темирлан Кудайберген on 01.08.2023.
//

import UIKit

final class AboutMeViewCell: UICollectionViewCell {
    
    // MARK: Properties
    
    static let identifier = "AboutMeViewCell"
    
    //    MARK: - UI
    
    private let informationLable: UITextView = {
        let textView = UITextView()
        textView.font = UIFont.systemFont(ofSize: 16)
        textView.isScrollEnabled = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
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
            informationLable.leadingAnchor.constraint(equalTo: leadingAnchor),
            informationLable.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    
    public func configureCell(information: String) {
        informationLable.text = information
    }
    
}
