//
//  Payment.swift
//  tryleancloud
//
//  Created by Liping on 11/24/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit
// import AVOSCloud

class Payment: AVObject, AVSubclassing {
    
    // Payment time is represented by createdAt which is inherited from AVObject
    // var createdAt: NSDate!
    
    @NSManaged var buyer: User?
    
    @NSManaged var auction: Auction?
    
    @NSManaged var invoice: NSNumber?
    
    static func parseClassName() -> String! {
        return "Payment"
    }
}