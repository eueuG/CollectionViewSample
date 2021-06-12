//
//  ColorSampleNextViewController.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/12.
//

import UIKit

class ColorSampleNextViewController: UIViewController{
    
    @IBOutlet weak var backgroundLabel: UILabel!
    
    var receiveColor: UIColor = UIColor.black
    var receiveColorName: String = "black"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        backgroundLabel.backgroundColor = receiveColor
        self.navigationItem.title = receiveColorName
    }
}
