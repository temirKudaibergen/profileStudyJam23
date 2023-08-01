//
//  MockData.swift
//  profileStudyJam23
//
//  Created by Темирлан Кудайберген on 01.08.2023.
//

struct MockData {
    
    static let shared = MockData()
    
    private let mySkills: ListSection = {
        .mySkills([.init(skills: ["GCD", "UIKit"], information: nil)])
    }()
    
    private let aboutMe: ListSection = {
        .aboutMe([.init(skills: nil, information: "Я из Казахстана")])
    }()
    
    var pageData: [ListSection] {
        [mySkills, aboutMe]
    }

}
