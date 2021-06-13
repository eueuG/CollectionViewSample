//
//  CollectionViewCell.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/13.
//

import UIKit

final class CollectionViewCell: UICollectionViewCell {

    static var toString: String {
        return String(describing: self)
    }
    static let id = CollectionViewCell.toString
    static func nib() -> UINib {
        return UINib(nibName: CollectionViewCell.toString, bundle: nil)
    }

    @IBOutlet private weak var imageView: UIImageView!
    @IBOutlet private weak var label: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with model: Model) {
        imageView.image = UIImage(named: model.imageName)
        label.text = model.text
    }

}
