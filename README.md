# Multiple-App-Icons
This is a demo of how to have multiple app icons like Apple's WWDC app.

![](/Assets/WWDC-app-icons.gif)

</br>

## Getting started
The first thing you are going to want to do is setup a basic UITableViewController.


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


