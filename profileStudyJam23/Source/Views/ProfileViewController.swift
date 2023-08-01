//
//  ProfileViewController.swift
//  profileStudyJam23
//
//  Created by Темирлан Кудайберген on 01.08.2023.
//

import UIKit

final class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        view.backgroundColor = .white
    }
    
    //    MARK: - Setup
    private func configureView() {
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = false
        let viewController = ProfileViewController()

    }
    
}

