//
//  BiddingViewController.swift
//  BidMe
//
//  Created by Liping on 12/7/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit
// import AVOSCloud

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
        if let auctionItemName = auction?.item?.name {
            itemName.text = "Item: " + String(auctionItemName)
        }

        if let auctionCurrentPrice = auction?.currentPrice {
            currentPrice.text = "Current Price: " + String(auctionCurrentPrice)
            highestPrice = Int(auctionCurrentPrice)
        }

        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("update"), userInfo: nil, repeats: true)

        self.performSegueWithIdentifier("ShowPayPal", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func update() {

        if let auction = auction {

            if let auctionEndTime = auction.endTime {
                let dateComponentsFormatter = NSDateComponentsFormatter()
                dateComponentsFormatter.unitsStyle = NSDateComponentsFormatterUnitsStyle.Full
                let interval = auctionEndTime.timeIntervalSinceNow

                if (interval > -1) {
                    timeLeft.text = "Time Left: " + String(dateComponentsFormatter.stringFromTimeInterval(interval)!)
                } else {
                    self.timer.invalidate()
                    let biddingQuery = Bidding.query()
                    biddingQuery.whereKey("auction", equalTo: auction)
                    biddingQuery.orderByDescending("price")
                    biddingQuery.limit = 1
                    let finalBidding = biddingQuery.findObjects()[0] as! Bidding
                    if (finalBidding.bidder!.objectId == User.currentUser().objectId) {
                        let alert = UIAlertController(title: "Congradulation", message: "You win the auction!", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                    } else {
                        let alert = UIAlertController(title: "Unfortunately", message: "Good luch next time!", preferredStyle: UIAlertControllerStyle.Alert)
                        alert.addAction(UIAlertAction(title: "Close", style: UIAlertActionStyle.Default, handler: nil))
                        self.presentViewController(alert, animated: true, completion: nil)
                    }
                }
            }

            let biddingQuery = Bidding.query()
            biddingQuery.whereKey("auction", equalTo: auction)
            biddingQuery.orderByDescending("price")
            biddingQuery.limit = 1
            biddingQuery.findObjectsInBackgroundWithBlock({(objects: [AnyObject]?, error: NSError?) in
                if (objects!.count >= 1) {
                let highBiddings = objects as! [Bidding]
                    self.highestPrice = Int(highBiddings[0].price!)
                    self.currentPrice.text = "Current Price: " + String(self.highestPrice)
                }
            })
        }
    }

    @IBAction func backToBidding(unwindSegue: UIStoryboardSegue) {
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
