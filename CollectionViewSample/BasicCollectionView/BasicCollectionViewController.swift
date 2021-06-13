//
//  BasicCollectionViewController.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/13.
//

import UIKit

class BasicCollectionView: UIViewController {
    
}

extension BasicCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        <#code#>
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        <#code#>
    }
    
    
}

extension BasicCollectionView: UICollectionViewDelegate {
    
}
