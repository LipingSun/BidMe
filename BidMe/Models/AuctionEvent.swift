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
    var image: UIImage?
    var act:Auction

//    init(title: String, locationName: String, category: String, coordinate: CLLocationCoordinate2D) {
//        self.title = title
//        self.locationName = locationName
//        self.category = category
//        self.coordinate = coordinate
//        self.act = nil
//        super.init()
//    }

    func assignImage(img: UIImage){
        self.image = img
    }

    func assignAuction(auction:Auction){
        self.act = auction
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

        self.image = UIImage(data: (auction.item?.picture?.getData())!)

        self.locationName = "location"

        if let location = auction.location {
            self.coordinate = CLLocationCoordinate2D(latitude: location.latitude, longitude: location.longitude)
        } else {
            self.coordinate = CLLocationCoordinate2D()
        }
        self.act = auction
        super.init()
    }

    var subtitle: String? {
        return category
    }

}