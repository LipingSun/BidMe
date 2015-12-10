//
//  ViewController.swift
//  CMPE277BidMe
//
//  Created by Yue Shen on 12/2/15.
//  Copyright © 2015 Yue Shen. All rights reserved.
//

import UIKit
import AVOSCloud

class AuctionListViewController: UITableViewController {
    
    var auctions:[Auction] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupLeftMenuButton()
        
//        Auction.query().findObjectsInBackgroundWithBlock({(objects: [AnyObject]?, error: NSError?) in
//            if let auctions = objects as? [Auction] {
//                for auction in auctions {
//                    itemList.append(auction.item!.name! as String)
//                }
//            }
//        })
        let auctionQuery = Auction.query()
        auctionQuery.includeKey("item.picture")
        auctionQuery.findObjectsInBackgroundWithBlock({(objects: [AnyObject]?, error: NSError?) in
            if let auctions = objects as? [Auction] {
                self.auctions = auctions
            }
            self.tableView.reloadData()
        })
//        self.auctions = auctionQuery.findObjects() as! [Auction]

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

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.auctions.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        // Get Cell Label
        let indexPath = tableView.indexPathForSelectedRow;
        let currentCell = tableView.cellForRowAtIndexPath(indexPath!) as UITableViewCell!;
        let storyboard = UIStoryboard(name: "Center", bundle: nil)
        let detailViewController = storyboard.instantiateViewControllerWithIdentifier("AuctionDetailViewController") as! AuctionDetailViewController
        detailViewController.auction = auctions[(indexPath?.row)!]
        self.showViewController(detailViewController, sender: self)
    }
    

}

