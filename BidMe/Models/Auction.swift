//
//  Auction.swift
//  tryleancloud
//
//  Created by Liping on 11/25/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit
// import AVOSCloud
import MapKit

class Auction: AVObject, AVSubclassing {
    
    @NSManaged var item: Item?
    
    @NSManaged var location: AVGeoPoint?
    
    @NSManaged var startPrice: NSNumber?
    
    @NSManaged var currentPrice: NSNumber?
    
    @NSManaged var startTime: NSDate?
    
    @NSManaged var endTime: NSDate?
    
    @NSManaged var status: NSString?
    
    override init() {
        super.init()
    }
    
    init(item: Item, location: AVGeoPoint, startPrice: NSNumber) {
        super.init()
        self.item = item
        self.location = location
        self.startPrice = startPrice
    }
    
    static func parseClassName() -> String! {
        return "Auction"
    }
    
}