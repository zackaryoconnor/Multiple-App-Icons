//
//  ViewController.swift
//  Multiple App Icons
//
//  Created by Zackary O'Connor on 6/18/19.
//  Copyright © 2019 Zackary O'Connor. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    fileprivate let cellId = "cellId"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

}




extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        return cell
    }
    
}
