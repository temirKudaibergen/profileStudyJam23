//
//  ExtensionProfileView.swift
//  profileStudyJam23
//
//  Created by Темирлан Кудайберген on 01.08.2023.
//

import UIKit

extension ProfileView: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections[section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch sections[indexPath.section] {
        case .mySkills(let mySkills):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MySkillViewCell.identifier,
                                                                for: indexPath) as? MySkillViewCell
            else { return UICollectionViewCell() }
            cell.configureCell(skills: mySkills[indexPath.row].skills ?? [""])
            return cell
        case .aboutMe(let aboutMe):
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AboutMeViewCell.identifier,
                                                                for: indexPath) as? AboutMeViewCell
            else { return UICollectionViewCell() }
            cell.configureCell(information: aboutMe[indexPath.row].information ?? "")
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        switch kind {
        case UICollectionView.elementKindSectionHeader:
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: HeaderSupplementaryView.identifier,
                                                                         for: indexPath) as! HeaderSupplementaryView
            header.configureHeader(categoryName: sections[indexPath.section].title)
            return header
        default:
            return UICollectionReusableView()
        }
    }
    
    //    MARK: - Creat Layout
    
    func createLayout() -> UICollectionViewCompositionalLayout {
        UICollectionViewCompositionalLayout { [weak self] sectionIndex, _ in
            guard let self = self else { return nil}
            let section = self.sections[sectionIndex]
            switch section {
            case .mySkills(_):
                return self.creatMySkillsSections()
            case .aboutMe(_):
                return self.creatAboutMeSections()
            }
        }
    }
    
    private func creatMySkillsSections() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(
            top: 12, leading: 24,
            bottom: 12, trailing: 24)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(1))
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
            widthDimension: .absolute(70),
            heightDimension: .absolute(90)),
            subitems: [layoutItem])
        
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 10,
            bottom: 0, trailing: 0)
        
        let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(
            top: 0, leading: 0,
            bottom: 0, trailing: 0)
        sectionLayout.orthogonalScrollingBehavior = .groupPaging
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .estimated(30)
        )
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
        
        return sectionLayout
    }
    
    private func creatAboutMeSections() -> NSCollectionLayoutSection {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                              heightDimension: .fractionalHeight(1))
        
        let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
        layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
        
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1),
                                               heightDimension: .fractionalWidth(1))
        
        let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [layoutItem])
        layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        
        let sectionLayout = NSCollectionLayoutSection(group: layoutGroup)
        sectionLayout.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 5)
        sectionLayout.orthogonalScrollingBehavior = .groupPaging
        
        let layoutSectionHeaderSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.93),
            heightDimension: .estimated(30)
        )
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
            layoutSize: layoutSectionHeaderSize,
            elementKind: UICollectionView.elementKindSectionHeader,
            alignment: .top
        )
        sectionLayout.boundarySupplementaryItems = [layoutSectionHeader]
        
        return sectionLayout
    }
}
