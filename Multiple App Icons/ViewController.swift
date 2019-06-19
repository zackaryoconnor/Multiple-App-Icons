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
    
    fileprivate let appIcons = [
        "red",
        "blue",
        "green",
        "orange",
        "yellow"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }

    
    fileprivate func setAppIcon(_ named: String?) {
        UIApplication.shared.setAlternateIconName(named) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }
    }
    
}




extension ViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return appIcons.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.textLabel?.text = appIcons[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if UIApplication.shared.supportsAlternateIcons {
            let row = indexPath.row
            
            switch row {
            case 0: setAppIcon(nil)
            case 1: setAppIcon("blue-icon")
            case 2: setAppIcon("green-icon")
            case 3: setAppIcon("orange-icon")
            case 4: setAppIcon("yellow-icon")
            default: setAppIcon(nil)
            }
        }
    }
    
}
