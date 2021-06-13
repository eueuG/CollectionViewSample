//
//  ColorSampleViewController.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/12.
//

import UIKit

class ColorSampleViewController: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!

    let colors: [UIColor] = [UIColor.black, UIColor.blue, UIColor.brown, UIColor.cyan, UIColor.darkGray, UIColor.darkText, UIColor.gray, UIColor.green, UIColor.lightGray, UIColor.orange, UIColor.red]
    
    let colorNames: [String] = ["black", "blue", "brown", "cyan", "darkGray", "darkText", "gray", "green", "lightGray", "orange", "red"]

    var giveColor: UIColor = UIColor.black
    // 画面遷移先に渡す色の名前
    var giveColorName: String = "black"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //collectionView.delegate = self
        //collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return colors.count
        }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            // Identifierが"CollectionViewCell"でCollectionViewCellというクラスのcellを取得
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColorSampleCell", for: indexPath) as! ColorSampleCollectionViewCell

            // cellのlabelに色付け
            cell.label.backgroundColor = colors[indexPath.item]
            // cellのnameに色の名前を入れる
            cell.name.text = colorNames[indexPath.item]

            return cell
        }
    
    // cell選択時に呼ばれる関数
        // 画面遷移先に渡すデータをここで格納する
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        giveColor = colors[indexPath.item]
        giveColorName = colorNames[indexPath.item]
        // Identifierが"Segue"のSegueを使って画面遷移する関数
        performSegue(withIdentifier: "Segue", sender: nil)
    }
    
    // 画面遷移先のViewControllerを取得し、データを渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Segue" {
            let vc = segue.destination as! ColorSampleNextViewController
            vc.receiveColor = giveColor
            vc.receiveColorName = giveColorName
        }
    }
}
