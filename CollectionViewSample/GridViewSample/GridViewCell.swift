//
//  GridCollectionViewCell.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/13.
//

import UIKit

final class GridViewCell: UICollectionViewCell {

    static var identifier: String {
        return String(describing: self)
    }

    private let colors: [UIColor] = [.red,
                                     .blue,
                                     .green,
                                     .yellow,
                                     .orange,
                                     .cyan,
                                     .magenta
    ]

    override init(frame: CGRect) {
        super.init(frame: frame)

        contentView.backgroundColor = colors.randomElement()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
