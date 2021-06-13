//
//  HFCollectionViewCell.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/13.
//

import UIKit

final class HFCollectionViewCell: UICollectionViewCell {
    
    static var toString: String {
        return String(describing: self)
    }
    //String(describing: self)を共通化したいための toString
    //static var identifier: String { String(describing: self) }
    //static var nib: UINib { UINib(nibName: String(describing: self), bundle: nil) }
    //とか書くのもわかりやすいかも

    
    static let id = HFCollectionViewCell.toString
    
    static func nib() -> UINib {
        return UINib(nibName: HFCollectionViewCell.toString, bundle: nil)
    }
    
    func configure() {
        backgroundColor = .red
    }
}
