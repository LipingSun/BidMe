//
//  LoginViewController.swift
//  BidMe
//
//  Created by Liping on 11/30/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit
import AVOSCloud

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
        let centerStoryboard: UIStoryboard = UIStoryboard(name: "Center", bundle: nil)
        let centerViewController = centerStoryboard.instantiateViewControllerWithIdentifier("PGTopViewController")
        self.presentViewController(centerViewController, animated: true, completion: nil)
        
//        AVUser.logInWithUsernameInBackground(userName.text, password: password.text, block: {(user: AVUser?, error: NSError?) in
//            if let user = user {
//                print("login success!")
//                
//            } else {
//                print(error)
//            }
//        })
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
