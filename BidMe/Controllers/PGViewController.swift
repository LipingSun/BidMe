//
//  CenterViewController.swift
//  BidMe
//
//  Created by Liping on 12/3/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit

class PGViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.performSegueWithIdentifier("DrawerSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "DrawerSegue") {
            let destinationViewController = segue.destinationViewController as! MMDrawerController
            
            // Instantitate and set the center view controller.
            let centerViewController = self.storyboard!.instantiateViewControllerWithIdentifier("AuctionListTopViewController")
            destinationViewController.centerViewController = centerViewController
            
            // Instantiate and set the left drawer controller.
            let leftViewController = self.storyboard!.instantiateViewControllerWithIdentifier("LeftSideViewController")
            destinationViewController.leftDrawerViewController = leftViewController
            
            // Instantiate and set gestures for left drawer
            destinationViewController.openDrawerGestureModeMask = MMOpenDrawerGestureMode.PanningCenterView
            destinationViewController.closeDrawerGestureModeMask = MMCloseDrawerGestureMode.PanningCenterView
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
