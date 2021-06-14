//
//  CVCompositionalLayoutViewController.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/14.
//

import UIKit

class CVCompositionalLayoutViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet private weak var collectionView: UICollectionView!
        
        override func viewDidLoad() {
            super.viewDidLoad()
            collectionView.dataSource = self
            collectionView.delegate = self
        }
        
        override func viewWillLayoutSubviews() {
            super.viewWillLayoutSubviews()
            collectionView.collectionViewLayout = layout()
        }
}

extension CVCompositionalLayoutViewController {
    func layout() -> UICollectionViewCompositionalLayout {
        let sideMargin: CGFloat = 25
        let interItemSpacing: CGFloat = 10
        let horizontalItemCount: CGFloat = 3
        
        let availableWidth = collectionView.frame.width - sideMargin * 2 - (horizontalItemCount - 1) * interItemSpacing
        let itemWidth = availableWidth / horizontalItemCount
        
        
        // Item
        let itemSize = NSCollectionLayoutSize(widthDimension: .absolute(itemWidth),
                                              heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        // Group
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0),
                                               heightDimension: .absolute(itemWidth * 3 / 4))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize,
                                                       subitems: [item])
        group.interItemSpacing = .fixed(interItemSpacing)
        
        
        // Section
        let section = NSCollectionLayoutSection(group: group)
        section.interGroupSpacing = 10
        section.contentInsets = NSDirectionalEdgeInsets(top: 10,
                                                        leading: sideMargin,
                                                        bottom: 10,
                                                        trailing: sideMargin)
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        
        return layout
    }
}

extension CVCompositionalLayoutViewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "compocell", for: indexPath)
        cell.backgroundColor = (indexPath.row % 2 == 0 ? .blue : .red)
        return cell
    }
}
