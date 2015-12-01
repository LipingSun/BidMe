//
//  AuctionEvent.swift
//  BidMe
//
//  Created by Dexter Wei on 12/1/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import Foundation
import MapKit

class AuctionEvent: NSObject, MKAnnotation{
    //public var coordinate: CLLocationCoordinate2D { get }
    
    // Title and subtitle for use by selection UI.
    //optional public var title: String? { get }
    //optional public var subtitle: String? { get }
    let title: String?
    let locationName: String
    let category: String
    let coordinate: CLLocationCoordinate2D
    
    init(title: String, locationName: String, category: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.locationName = locationName
        self.category = category
        self.coordinate = coordinate
        
        super.init()
    }
    
    init(auction: Auction) {
        
        if let item = auction.item {
            if let title = item.name{
                self.title = String(title)
            }else{
                self.title = "mystery"
            }
            
            if let desc = item.desc{
                self.category = String(desc)
            }else{
                self.category = ""
            }
        }else{
            self.title = "mystery"
            self.category = ""
        }
        
        self.locationName = "location"
        
        self.coordinate = CLLocationCoordinate2D(latitude: auction.location!.latitude, longitude: auction.location!.longitude)
        
        super.init()
    }
    
    var subtitle: String? {
        return category
    }

}