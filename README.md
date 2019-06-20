# Multiple-App-Icons
This is a demo of how to have multiple app icons like Apple's WWDC app.

![](/Assets/WWDC-app-icons.gif)

</br>

## Getting Started

</br>

## UITableViewController
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

## Import and setup app icons
Next, create a new folder named ‘App Icons’, or whatever you want to call it. We will be storing our assets in this folder instead of in the ‘Assets.xcassets’ folder.
Drag and drop your app icon assets into the folder we just created and check the box that says ‘copy items if needed’.

![](/Assets/Screen-shots/Copy-items-if-needed-screen-shot.png)

Since we aren't using the app icon template Assets.xcassests, we need to delete it. Click the 'Assets.xcassests' and right click on 'AppIcon' and select 'Remove Selected Items' 

Now go to the project overview, I think thats what its called...
Once there scroll down a little bit and select the drop down next to 'App Icons Source', and click on 'Don't use asset catalogs'.

![](/Assets/Screen-shots/Dont-use-asset-catalogs-screen-shot.png)

After selecting 'Don't use asset catalogs, it may be red and still saying "AppIcon", it's just a bug in xcode, so don't worry about it.

![](/Assets/Screen-shots/Asset-catalog-missing-screen-shot.png)

We will then head back to the ViewController.swift file and create an array containing all the names of the images we will be using. 
`fileprivate let appIcons = [
        "red",
        "blue",
        "green",
        "orange",
        "yellow"
    ]`

Inside the ‘numberOfRowsInSection’ change the number of items being returned, to
`return appIcons.count`,

and inside the ‘cellForRowAt’ add 
`cell.textLabel?.text = appIcons[indexPath.row]`

</br>

 ## Info.plist
 
Now right click on ‘Info.plist’ and click ‘Open As’ and select ‘Source Code’
Paste this code right below the first ’<dict>’.

    <key>CFBundleIcons</key>
        <dict>
            <key>CFBundlePrimaryIcon</key>
            <dict>
                <key>CFBundleIconFiles</key>
                <array>
                    <string>YOUR PRIMARY APP ICON NAME HERE</string>
                </array>
                <key>UIPrerenderedIcon</key>
                <false/>
            </dict>
            <key>CFBundleAlternateIcons</key>
            <dict>
                <key>YOUR SECONDARY APP ICON NAME HERE</key>
                <dict>
                    <key>CFBundleIconFiles</key>
                    <array>
                        <string>YOUR SECONDARY APP ICON NAME HERE</string>
                    </array>
                    <key>UIPrerenderedIcon</key>
                    <false/>
                </dict>
            </dict>
        </dict>
   
    
add this code for every additional app icon you have, inside the 'CFBundleAlternateIcons' dictionary.
    
       <key>YOUR SECONDARY APP ICON NAME HERE</key>
        <dict>
            <key>CFBundleIconFiles</key>
            <array>
                <string>YOUR SECONDARY APP ICON NAME HERE</string>
            </array>
            <key>UIPrerenderedIcon</key>
            <false/>
        </dict>
    
Since we have five icons, our code would be...
    
    <key>CFBundleIcons</key>
        <dict>
            <key>CFBundlePrimaryIcon</key>
            <dict>
                <key>CFBundleIconFiles</key>
                <array>
                    <string>red_icon</string>
                </array>
                <key>UIPrerenderedIcon</key>
                <false/>
            </dict>
            <key>CFBundleAlternateIcons</key>
            <dict>
                <key>red_icon</key>
                <dict>
                    <key>CFBundleIconFiles</key>
                    <array>
                        <string>red_icon</string>
                    </array>
                    <key>UIPrerenderedIcon</key>
                    <false/>
                </dict>
            <key>blue_icon</key>
                <dict>
                    <key>CFBundleIconFiles</key>
                    <array>
                        <string>blue_icon</string>
                    </array>
                    <key>UIPrerenderedIcon</key>
                    <false/>
                </dict>
                <key>green_icon</key>
                <dict>
                    <key>CFBundleIconFiles</key>
                    <array>
                        <string>green_icon</string>
                    </array>
                    <key>UIPrerenderedIcon</key>
                    <false/>
                </dict>
                <key>orange_icon</key>
                <dict>
                    <key>CFBundleIconFiles</key>
                    <array>
                        <string>orange_icon</string>
                    </array>
                    <key>UIPrerenderedIcon</key>
                    <false/>
                </dict>
                <key>yellow_icon</key>
                <dict>
                    <key>CFBundleIconFiles</key>
                    <array>
                        <string>yellow_icon</string>
                    </array>
                    <key>UIPrerenderedIcon</key>
                    <false/>
                </dict>
            </dict>
        </dict>

Our Info.plist should look something like this now.

![](/Assets/Screen-shots/Info.plist-screen-shot.png)

</br>

## Change the app icon 

In  ViewController.swift, create a function called ‘setAppIcon’ and make it take in a parameter called ‘_ named’ and be of type ’String’.
        `func setAppIcon(_ named: String?) {}`

Inside the ‘setAppIcon’ function, add 
       `UIApplication.shared.setAlternateIconName(named) { (error) in
            if let error = error {
                print(error.localizedDescription)
            }
        }`

Now let's add `override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {}`
Create a contant called 'row' and set it equal to the 'indexPath.row' `let row = indexPath.row`

Now we're going to use a switch statement to determine which cells are tapped and which app icon to display.
We are going to create a case for every app icon you have, in each case, we will call our 'setAppIcon' function we created earlier. Set the first app icon to 'nil', because it is set as the default app icon in our info.plist. The other app icons will get set to the names of the files imported, and the default case will aslo be 'nil'. 
            
            switch row {
            case 0: setAppIcon(nil)
            case 1: setAppIcon("blue-icon")
            case 2: setAppIcon("green-icon")
            case 3: setAppIcon("orange-icon")
            case 4: setAppIcon("yellow-icon")
            default: setAppIcon(nil)
            }



Our final code should look something like this.

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
    
    
Lets run the app make sure everything is working properly.

<img src="/Assets/Screen-shots/Simulator%20Screen%20Shot%20-%20iPhone%20Xs%20-%20red%20icon.png" width=250><img src="/Assets/Screen-shots/Simulator%20Screen%20Shot%20-%20iPhone%20Xs%20-%20selected%20different%20icon.png" width=250><img src="/Assets/Screen-shots/Simulator%20Screen%20Shot%20-%20iPhone%20Xs%20-%20blue%20icon.png" width=250>

Awesome! Everything is working!
