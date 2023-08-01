//
//  MockData.swift
//  profileStudyJam23
//
//  Created by Темирлан Кудайберген on 01.08.2023.
//

struct MockData {
    
    static let shared = MockData()
    
    private let mySkills: ListSection = {
        .mySkills([.init(skills: ["GCD", "GCD","GCD"],
                         information: nil)])
    }()
    
    private let aboutMe: ListSection = {
        .aboutMe([.init(skills: [""], information: "Experienced software engineer skilled in developing scalable and maintainable systems")])
    }()
    
    var pageData: [ListSection] {
        [mySkills, aboutMe]
    }

}
