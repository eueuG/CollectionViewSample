//
//  CVInsideTVViewController.swift
//  CollectionViewSample
//
//  Created by 野田凜太郎 on 2021/06/13.
//

import UIKit

class CVInsideTVViewController: UIViewController {
    @IBOutlet private weak var tableView: UITableView!
    
    private var models = [Model]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 1...10 {
            models.append(Model(text: "suko", imageName: "image1"))
            models.append(Model(text: "suko", imageName: "image2"))
            models.append(Model(text: "suko", imageName: "image3"))
        }
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(CollectionTableViewCell.nib(), forCellReuseIdentifier: CollectionTableViewCell.id)
        
    }
}

extension CVInsideTVViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }

}

extension CVInsideTVViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CollectionTableViewCell.id, for: indexPath) as! CollectionTableViewCell
        cell.configure(with: models)
        return cell
    }

}
