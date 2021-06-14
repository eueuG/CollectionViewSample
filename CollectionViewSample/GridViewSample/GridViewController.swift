//
//  instagramUISampleViewController.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/14.
//

import UIKit

class GridViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //collectionView.collectionViewLayout = layout()
        
        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(
            section: gridSection()
        )
        collectionView.register(GridCell.self,
                                forCellWithReuseIdentifier: GridCell.identifier)
        collectionView.dataSource = self
    }
}

extension GridViewController {
    private func gridSection() -> NSCollectionLayoutSection {
        let itemCount = 3
        let lineCount = itemCount - 1
        let itemSpacing = CGFloat(2) //セルの間の空間
        let itemLength = (self.view.frame.size.width - (itemSpacing * CGFloat(lineCount))) / CGFloat(itemCount)
        
        
        //セル一個のサイズを決定
        let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .absolute(itemLength), heightDimension: .absolute(itemLength) ))
        
        //itemを3個で一つのグループにしてる。グループの大きさは親Viewと同じ大きさ
        let items = NSCollectionLayoutGroup.horizontal(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)),subitem: item,count: itemCount)
        items.interItemSpacing = .fixed(itemSpacing) //itemの縦線の幅を追加してる
        
        //3個で一つのitemsを縦に並べてます
        let groups = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(itemLength)
            ),
            subitems: [items]
        )
        //groups.interItemSpacing = .fixed(itemSpacing + 10)
        
        let section = NSCollectionLayoutSection(group: groups)
        section.interGroupSpacing = itemSpacing //itemsごとに横線のスペースができた。セクションの中のオブジェクトに対してスペースを設けるらしい
        return section
    }
}

extension GridViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridCell.identifier, for: indexPath) as! GridCell
        return cell
    }

}
