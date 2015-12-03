//
//  RegisterViewController.swift
//  BidMe
//
//  Created by Liping on 11/30/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet var userName: UITextField!
    @IBOutlet var password: UITextField!
    @IBOutlet var email: UITextField!
    @IBOutlet var phone: UITextField!
    @IBOutlet var firstName: UITextField!
    @IBOutlet var lastName: UITextField!
    @IBOutlet var desc: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonPressed(sender: AnyObject) {
        let user = User()
        user.username = userName.text
        user.password = password.text
        user.email = email.text
        user.phone = phone.text
        user.firstName = firstName.text
        user.password = password.text
        user.desc = desc.text
        user.signUpInBackgroundWithBlock({(succeeded: Bool, error: NSError?) in
            if let error = error {
                print(error)
                let alertController = UIAlertController(title: "Register Failed", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
                self.showViewController(alertController, sender: self)
            } else {
                print("register success!")
                let centerStoryboard: UIStoryboard = UIStoryboard(name: "Center", bundle: nil)
                let centerViewController = centerStoryboard.instantiateViewControllerWithIdentifier("PGTopViewController")
                self.showViewController(centerViewController, sender: self)
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
