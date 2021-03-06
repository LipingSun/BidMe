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

    @IBOutlet var ItemDetailCurrentPrice: UILabel!

    @IBOutlet var ItemDetailStartPrice: UILabel!

    @IBOutlet var ItemDetailStartTime: UILabel!

    @IBOutlet var ItemDetailEndTime: UILabel!
    
    @IBOutlet var ItemDetailsOwnerIcon: UIImageView!

    var auction: Auction?

    override func viewDidLoad() {
        super.viewDidLoad()

        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = NSTimeZone(name: "PST")

        if let auction = auction {
            ItemDetailLabel.text = String(auction.item!.name!)
            ItemDetailImage.image = UIImage(data: (auction.item!.picture!.getData())!)
            ItemDetailDesc.text = "Description: " + String(auction.item!.desc!)
            ItemDetailCurrentPrice.text = "Current: $" + String(auction.currentPrice!)
            ItemDetailStartPrice.text = "Start: $" + String(auction.startPrice!)
            
            ItemDetailStartTime.text = "Start Time: " + dateFormatter.stringFromDate(auction.startTime!)
            ItemDetailEndTime.text = "End Time:   " + dateFormatter.stringFromDate(auction.endTime!)
        }
        
        ItemDetailsOwnerIcon.layer.cornerRadius = ItemDetailsOwnerIcon.frame.size.width / 2
        ItemDetailsOwnerIcon.clipsToBounds = true
        ItemDetailsOwnerIcon.layer.borderWidth = 3.0
        ItemDetailsOwnerIcon.layer.borderColor = UIColor.whiteColor().CGColor
        ItemDetailsOwnerIcon.userInteractionEnabled = true
        let tapGestureRecognizer = UITapGestureRecognizer(target:self, action:Selector("startChat:"))
        ItemDetailsOwnerIcon.addGestureRecognizer(tapGestureRecognizer)
        
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

    @IBAction func startChat(sender: AnyObject) {
        CDChatManager.sharedManager().openWithClientId(User.currentUser().username, callback: { (result: Bool, error: NSError!) -> Void in
            if (error == nil) {
                CDChatManager.sharedManager().fetchConvWithOtherId(self.auction!.item!.owner!.username, callback: { (conv: AVIMConversation!, error: NSError!) -> Void in
                    if (error != nil) {
                        print("error: \(error)")
                    } else {
                        let chatRoomVC = CDChatRoomVC(conv:conv)
                        self.navigationController?.pushViewController(chatRoomVC, animated: true)
                    }
                })
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
