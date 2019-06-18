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
  
</br>

Next, create a new folder named ‘App Icons’, or whatever you want to call it. We will be storing our assets in this folder instead of in the ‘Assets.xcassets’ folder.
Drag and drop your app icon assets into the folder we just created and check the box that says ‘copy items if needed’.



We will then head back to the ViewController.swift file and create an array containing all the names of the images we will be using. 
`fileprivate let appIcons = [
        "red",
        "blue",
        "green",
        "orange",
        "yellow"
    ]`

Now inside the ‘numberOfRowsInSection’ change the number of items being returned, to
`return appIcons.count`

Inside the ‘cellForRowAt’ add 
`cell.textLabel?.text = appIcons[indexPath.row]`
