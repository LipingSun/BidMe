//
//  LeftSideViewController.swift
//  CMPE277BidMe
//
//  Created by Yue Shen on 12/2/15.
//  Copyright © 2015 Yue Shen. All rights reserved.
//

import UIKit

class LeftSideViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var menuItems:[String] = ["Home", "Account", "MapView", "History"]
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let mycell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath) as! MyCustomTableViewCell
        
        mycell.menuItemLabel.text = menuItems[indexPath.row]
        
        return mycell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (self.currentIndex == indexPath.row) {
            self.mm_drawerController.closeDrawerAnimated(true, completion: nil)
            return
        }
        
        var centerViewController:CenterViewController?
        switch(indexPath.row) {
        
        case 0:
            centerViewController = self.storyboard!.instantiateViewControllerWithIdentifier("AuctionListTopViewController") as? CenterViewController
            break
        case 1:
            break
            
        case 2:
//            let mapStoryboard: UIStoryboard = UIStoryboard(name: "Map", bundle: nil)
//            var mapViewController = mapStoryboard.instantiateViewControllerWithIdentifier("MapViewController") as! MapViewController
//            var mapNavController = UINavigationController(rootViewController: mapViewController)
//            var appDelegate:AppDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
//            
//            appDelegate.centerContainer!.centerViewController = mapNavController
//            appDelegate.centerContainer!.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
            
            break
            
        default:
            print("\(menuItems[indexPath.row]) is selected")
        }
        
        if let centerViewController = centerViewController {
            self.currentIndex = indexPath.row
            self.mm_drawerController.setCenterViewController(centerViewController, withCloseAnimation: true, completion: nil)
        } else {
            self.mm_drawerController.closeDrawerAnimated(true, completion: nil)
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
