//
//  ListSection.swift
//  profileStudyJam23
//
//  Created by Темирлан Кудайберген on 01.08.2023.
//

enum ListSection {
    case mySkills([ListItem])
    case aboutMe([ListItem])
    
    var items: [ListItem] {
        switch self {
        case.mySkills(let items),
                .aboutMe(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .mySkills(_):
            return "Мои навыки"
        case .aboutMe(_):
            return "О себе"
        }
    }
}

