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
    
    @IBOutlet var ItemDetailDesc: UILabel!
    
    @IBOutlet var ItemDetailPrice: UILabel!
    
    var passedValue:String?
    
    var passedImage:UIImage?
    
    var auction: Auction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let auction = auction {
            ItemDetailLabel.text = String(auction.item!.name!)
            ItemDetailImage.image = UIImage(data: (auction.item!.picture!.getData())!)
            ItemDetailDesc.text = "Description: " + String(auction.item!.desc!)
            ItemDetailPrice.text = "Current Price: " + String(auction.startPrice!)
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func bidButtonTapped(sender: AnyObject) {
        let storyboard = UIStoryboard(name: "Bidding", bundle: nil)
        let biddingViewController = storyboard.instantiateViewControllerWithIdentifier("BiddingViewController") as! BiddingViewController
        biddingViewController.auction = auction
        self.showViewController(biddingViewController, sender: self)
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
