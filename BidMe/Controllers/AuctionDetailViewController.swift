//
//  AuctionDetailViewController.swift
//  CMPE277BidMe
//
//  Created by Yue Shen on 12/3/15.
//  Copyright © 2015 Yue Shen. All rights reserved.
//

import UIKit

class AuctionDetailViewController: UIViewController {
    
    @IBOutlet weak var ItemDetailLabel: UILabel!
    
    @IBOutlet weak var ItemDetailImage: UIImageView!
    
    var passedValue:String?
    
    var passedImage:UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ItemDetailLabel.text = passedValue
        ItemDetailImage.image = passedImage

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
