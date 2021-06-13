//
//  CollectionTableViewCell.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/13.
//

import UIKit

final class CollectionTableViewCell: UITableViewCell {
    
    static var toString: String {
        return String(describing: self)
    }
    static let id = CollectionTableViewCell.toString
    static func nib() -> UINib {
        return UINib(nibName: CollectionTableViewCell.toString, bundle: nil)
    }
    private var models = [Model]()
    
    @IBOutlet private weak var collectionView: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.nib(), forCellWithReuseIdentifier: CollectionViewCell.id)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure(with models: [Model]) {
        self.models = models
        collectionView.reloadData()
    }
    
}


extension CollectionTableViewCell: UICollectionViewDelegate {

}

extension CollectionTableViewCell: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        models.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.id, for: indexPath) as! CollectionViewCell
        let model = models[indexPath.row]
        cell.configure(with: model)
        return cell
    }

}

extension CollectionTableViewCell: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 250, height: 250)
    }

}
