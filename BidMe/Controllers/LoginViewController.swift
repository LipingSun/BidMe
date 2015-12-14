//
//  LoginViewController.swift
//  BidMe
//
//  Created by Liping on 11/30/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit
// import AVOSCloud

class LoginViewController: UIViewController {

    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonPressed(unwindSegue: UIStoryboardSegue) {
    }
    
    @IBAction func loginButtonPressed(sender: AnyObject) {
        AVUser.logInWithUsernameInBackground(userName.text, password: password.text, block: {(user: AVUser?, error: NSError?) in
            if let user = user as? User {
                print("login success!")
                let centerStoryboard: UIStoryboard = UIStoryboard(name: "Center", bundle: nil)
                let centerViewController = centerStoryboard.instantiateViewControllerWithIdentifier("PGTopViewController")
                self.showViewController(centerViewController, sender: self)
                
            } else {
                print(error)
                let alertController = UIAlertController(title: "Login Failed", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
                self.showViewController(alertController, sender: self)
            }
        })
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
