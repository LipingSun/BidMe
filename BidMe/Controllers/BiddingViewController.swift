//
//  BiddingViewController.swift
//  BidMe
//
//  Created by Liping on 12/7/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit
import AVOSCloud

class BiddingViewController: UIViewController {

    var auction: Auction?

    var timer = NSTimer()

    var highestPrice = Int()

    @IBOutlet var itemName: UILabel!

    @IBOutlet var currentPrice: UILabel!

    @IBOutlet var timeLeft: UILabel!

    @IBOutlet var newPrice: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func update() {

        if let auction = auction {
            auction.refresh()
            auction.item!.fetch()
            if let auctionItemName = auction.item?.name {
                itemName.text = "Item: " + String(auctionItemName)
            }
            let biddingQuery = Bidding.query()
            biddingQuery.whereKey("auction", equalTo: auction)
            biddingQuery.orderByDescending("price")
            biddingQuery.limit = 3
            let highBiddings = biddingQuery.findObjects()

            if let highBiddings = highBiddings {
                highestPrice = Int(highBiddings[0].price)
                currentPrice.text = "Current Price: " + String(highestPrice)
            }
            if let auctionEndTime = auction.endTime {
                let dateComponentsFormatter = NSDateComponentsFormatter()
                dateComponentsFormatter.unitsStyle = NSDateComponentsFormatterUnitsStyle.Full
                timeLeft.text = "Time Left: " + String(dateComponentsFormatter.stringFromTimeInterval(auctionEndTime.timeIntervalSinceNow)!)
            }
        }
    }

    @IBAction func bidButtonTapped(sender: AnyObject) {
        let bidding = Bidding()
        bidding.auction = auction
        bidding.bidder = User.currentUser()
        if let newPrice = Int(newPrice.text!) {
            if (newPrice > highestPrice) {
                bidding.price = newPrice
                bidding.save()
            } else {
//                let alertController = UIAlertController(title: "Your price is lower than current price!", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
//                alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
//                self.showViewController(alertController, sender: self)
            }
        } else {
//            let alertController = UIAlertController(title: "Please input your bidding price!", message: nil, preferredStyle: UIAlertControllerStyle.Alert)
//            alertController.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.Default, handler: nil))
//            self.showViewController(alertController, sender: self)
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
