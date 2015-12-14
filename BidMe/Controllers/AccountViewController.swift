//
//  AccountViewController.swift
//  CMPE277BidMe
//
//  Created by Yue Shen on 12/2/15.
//  Copyright © 2015 Yue Shen. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    @IBOutlet var userIcon: UIImageView!
    @IBOutlet var username: UILabel!
    @IBOutlet var email: UILabel!
    @IBOutlet var phone: UILabel!
    @IBOutlet var createTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setupLeftMenuButton()

        let user = User.currentUser()

        userIcon.layer.cornerRadius = userIcon.frame.size.width / 2
        userIcon.clipsToBounds = true
        userIcon.layer.borderWidth = 3.0
        userIcon.layer.borderColor = UIColor.whiteColor().CGColor

        username.text = user.username
        email.text = email.text! + user.email
        phone.text = phone.text! + String(user.phone!)

        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "PST")
        createTime.text = createTime.text! + dateFormatter.stringFromDate(user.createdAt!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func setupLeftMenuButton() {
        let leftDrawerButton = MMDrawerBarButtonItem(target: self, action: "leftSideMenuTapped:")
        self.navigationItem.setLeftBarButtonItem(leftDrawerButton, animated: false)
    }

    func leftSideMenuTapped(sender: AnyObject) {
        self.mm_drawerController.toggleDrawerSide(MMDrawerSide.Left, animated: true, completion: nil)
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
