//
//  GridViewController.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/13.
//
import UIKit

final class GridViewController: UIViewController, UICollectionViewDelegate {

    @IBOutlet private weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        collectionView.collectionViewLayout = UICollectionViewCompositionalLayout(
            section: gridSection()
        )
        collectionView.register(GridViewCell.self, forCellWithReuseIdentifier: GridViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self

    }
    
    private func gridSection() -> NSCollectionLayoutSection {

        let itemCount = 3
        let lineCount = itemCount - 1
        let itemSpacing = CGFloat(2)
        let itemLength = (self.view.frame.size.width - (itemSpacing * CGFloat(lineCount))) / CGFloat(itemCount)
        //Spacingの値がlineCountの数だけ使われるので、それをViewのサイズから引いて、横並びのアイテムに長さを割り当てる
        
        
        //一つのitem
        let item = NSCollectionLayoutItem(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .absolute(itemLength),
                heightDimension: .absolute(itemLength)
            )
        )
        //itemを三つ横並びに
        //.fractionalは親Viewとの割合
        let items = NSCollectionLayoutGroup.horizontal(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .fractionalHeight(1)
            ),
            subitem: item,
            count: itemCount
        )
        //item間のスペース
        items.interItemSpacing = .fixed(itemSpacing)
        //itemsが縦に並ぶグループを作成
        let groups = NSCollectionLayoutGroup.vertical(
            layoutSize: NSCollectionLayoutSize(
                widthDimension: .fractionalWidth(1),
                heightDimension: .absolute(itemLength)
            ),
            subitems: [items]
        )
        //groupsからsectionを生成
        let section = NSCollectionLayoutSection(group: groups)
        section.interGroupSpacing = itemSpacing
        return section

    }
}

extension GridViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 200
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: GridViewCell.identifier, for: indexPath) as! GridViewCell
        return cell
    }

}
