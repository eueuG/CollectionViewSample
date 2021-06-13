//
//  HFCollectionViewController.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/13.
//

import UIKit

class HFCollectionViewController: UIViewController, UICollectionViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: self.view.frame.size.width / 2.2,
                                 height: self.view.frame.size.width / 2.2)
        //collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(HFCollectionViewCell.nib(),
                                 forCellWithReuseIdentifier: HFCollectionViewCell.id)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        //view.addSubview(collectionView!)
        
        //これでCollectionViewのLayoutに反映させる
        self.collectionView.collectionViewLayout = layout
    }
    
//    override func viewDidLayoutSubviews() {
//            super.viewDidLayoutSubviews()
//            collectionView?.frame = self.view.bounds
//    }
}
extension HFCollectionViewController: UICollectionViewDelegateFlowLayout {
    
}


extension HFCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HFCollectionViewCell.id, for: indexPath) as! HFCollectionViewCell
        cell.configure()
        return cell
    }
    
    
}
