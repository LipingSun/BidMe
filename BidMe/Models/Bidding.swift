//
//  Bidding.swift
//  tryleancloud
//
//  Created by Liping on 11/25/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit
import AVOSCloud

class Bidding: AVObject, AVSubclassing {
    
    // Bidding time is represented by createdAt which is inherited from AVObject
    // var createdAt: NSDate!
    
    @NSManaged var bidder: User?
    
    @NSManaged var auction: Auction?
    
    @NSManaged var price: NSNumber?
    
    static func parseClassName() -> String! {
        return "Bidding"
    }
}