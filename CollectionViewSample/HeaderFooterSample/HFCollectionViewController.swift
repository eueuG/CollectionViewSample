//
//  HFCollectionViewController.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/13.
//

import UIKit

class HFCollectionViewController: UIViewController {
    
    
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
        
        //HeaderFooterViewを登録
        collectionView?.register(HeaderCollectionReusableView.self,
                                         forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                         withReuseIdentifier: HeaderCollectionReusableView.id)
        collectionView?.register(FooterCollectionReusableView.self,
                                         forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                                         withReuseIdentifier: FooterCollectionReusableView.id)
        
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
    
    //HeaderFooterの大きさ設定
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.size.width, height: 200)
    }
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter,
                                                                         withReuseIdentifier: FooterCollectionReusableView.id,
                                                                         for: indexPath) as! FooterCollectionReusableView
            footer.configure()
            return footer
        } else {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader,
                                                                         withReuseIdentifier: HeaderCollectionReusableView.id,
                                                                         for: indexPath) as! HeaderCollectionReusableView
            header.configure()
            return header
        }
    }
}

extension HFCollectionViewController: UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
}
