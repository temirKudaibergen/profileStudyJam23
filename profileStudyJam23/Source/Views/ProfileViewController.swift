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
        
    }
    
    //    MARK: - Setup
    private func configureView() {
        view.backgroundColor = .white
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = false
        let profileView = ProfileView()
        profileView.backgroundColor = .white
        view = profileView
    }
    
}

