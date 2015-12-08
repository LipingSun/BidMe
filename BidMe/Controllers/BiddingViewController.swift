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

    @IBOutlet var itemName: UILabel!

    @IBOutlet var currentPrice: UILabel!

    @IBOutlet var timeLeft: UILabel!

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
            if let auctionCurrentPrice = auction.currentPrice {
                currentPrice.text = "Current Price: " + String(auctionCurrentPrice)
            }
            if let auctionEndTime = auction.endTime {
                let dateComponentsFormatter = NSDateComponentsFormatter()
                dateComponentsFormatter.unitsStyle = NSDateComponentsFormatterUnitsStyle.Full
                timeLeft.text = "Time Left: " + String(dateComponentsFormatter.stringFromTimeInterval(auctionEndTime.timeIntervalSinceNow)!)
            }
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
