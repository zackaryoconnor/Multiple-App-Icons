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

## Import app icons and display our cells

Next, create a new folder named ‘App Icons’, or whatever you want to call it. We will be storing our assets in this folder instead of in the ‘Assets.xcassets’ folder.
Drag and drop your app icon assets into the folder we just created and check the box that says ‘copy items if needed’.

![](/Assets/Screen%20Shot%202019-06-18%20at%203.26.46%20PM.png)

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
