//
//  Auction.swift
//  tryleancloud
//
//  Created by Liping on 11/25/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit
import AVOSCloud
import MapKit

class Auction: AVObject, AVSubclassing {
    
    @NSManaged var item: Item?
    
    @NSManaged var location: AVGeoPoint?
    
    @NSManaged var startPrice: NSNumber?
    
    @NSManaged var currentPrice: NSNumber?
    
    @NSManaged var startTime: NSDate?
    
    @NSManaged var endTime: NSDate?
    
    @NSManaged var status: NSString?
    
    static func parseClassName() -> String! {
        return "Auction"
    }
    
//    internal var coordinate: CLLocationCoordinate2D{
//        let coord = CLLocationCoordinate2D(latitude: location!.latitude, longitude: location!.latitude)
//        return coord
//    }
    
}