//
//  BasicCollectionViewController.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/13.
//

import UIKit

class BasicCollectionView: UIViewController {
    
    let contentNeedShow = ["アップル","イチゴ","グレープ","パイナプル","キウイ","立山","男体山","谷川岳","金峰山","穂高岳","大菩薩嶺","コーヒー","豆乳","ジュース","炭酸","水"]

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



extension BasicCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return contentNeedShow.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! BasicCollectionViewCell
        cell.backgroundColor = UIColor.lightGray
        cell.layer.cornerRadius = 10
        cell.label.text = contentNeedShow[indexPath.row]
        return cell
    }
    
    
}

extension BasicCollectionView: UICollectionViewDelegate {
    
}
