//
//  ViewController.swift
//  CMPE277BidMe
//
//  Created by Yue Shen on 12/2/15.
//  Copyright © 2015 Yue Shen. All rights reserved.
//

import UIKit
import AVOSCloud

class AuctionListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var itemList = ["Printer", "Monitor", "Table", "Chair"]
    var imageList = [UIImage(named: "puppy1"), UIImage(named: "puppy2"), UIImage(named: "puppy3"), UIImage(named: "puppy4")]
    
    var auctions:[Auction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupLeftMenuButton()
        
//        let user = AVUser.currentUser() as! User
//        let img = AVFile(name: "bid.png", data: UIImagePNGRepresentation(UIImage(named: "bid")!))
//        img.saveInBackgroundWithBlock({(succeeded: Bool, error: NSError?) in
//            let item = Item(name: "bid", desc: "This is bid", picture: img, owner: user)
//            let auction = Auction(item: item, startPrice: 30)
//            auction.saveInBackgroundWithBlock({(succeeded: Bool, error: NSError?) in
//                if (succeeded) {
//                    print("good!")
//                }
//            })
//        })
        
//        Auction.query().findObjectsInBackgroundWithBlock({(objects: [AnyObject]?, error: NSError?) in
//            if let auctions = objects as? [Auction] {
//                for auction in auctions {
//                    itemList.append(auction.item!.name! as String)
//                }
//            }
//        })
        let auctionQuery = Auction.query()
        auctionQuery.includeKey("item.picture")
        self.auctions = auctionQuery.findObjects() as! [Auction]

//        self.auctions = Auction.query().findObjects() as! [Auction]
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
    
//    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
//        var cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
//        
//        cell.imageView?.image = imageList[indexPath.row]
//        cell.textLabel?.text = auctions[indexPath.row].item!.name as? String
//        
//        return cell
//    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.auctions.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: "cell")
        
//        Auction.query().findObjectsInBackgroundWithBlock({(objects: [AnyObject]?, error: NSError?) in
//            if let auctions = objects {
//                self.auctions = auctions as! [Auction]
//                
//                cell.imageView?.image = self.imageList[indexPath.row]
//                //        cell.textLabel?.text = itemList[indexPath.row]
//                cell.textLabel?.text = self.auctions[indexPath.row].item?.name as? String
//            }
//        })
        
        
        cell.imageView?.image = UIImage(data: self.auctions[indexPath.row].item!.picture!.getData())
        cell.textLabel?.text = String(self.auctions[indexPath.row].item!.name!)
        
        return cell
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("showDetail", sender: self)
    }
    
    

}

