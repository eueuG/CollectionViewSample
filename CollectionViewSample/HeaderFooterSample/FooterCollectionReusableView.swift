//
//  FooterCollectionReusableView.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/13.
//

import UIKit

final class FooterCollectionReusableView: UICollectionReusableView {
    
    static var toString: String {
        return String(describing: self)
    }
    
    static let id = FooterCollectionReusableView.toString

    //これ多分コンピューテッドプロパティ
    private let label: UILabel = {
        let label = UILabel()
        label.text = "header"
        label.font = .systemFont(ofSize: 50)
        label.textAlignment = .center
        label.textColor = .white
        return label
    }()
    
    func configure() {
        backgroundColor = .blue
        addSubview(label)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        label.frame = bounds
    }
}
