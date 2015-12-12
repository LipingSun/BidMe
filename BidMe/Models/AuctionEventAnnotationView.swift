//
//  AuctionEventAnnotationView.swift
//  BidMe
//
//  Created by Dexter Wei on 12/12/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import Foundation

import MapKit

class AuctionEventAnnotationView: MKAnnotationView{
    var auction:Auction?
    override init(annotation:MKAnnotation?, reuseIdentifier: String?) {
        if let ano = annotation as? AuctionEvent{
            self.auction = ano.act
            print("passing title ")
            print(self.auction!.item?.name)
        }
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)

    }

    func assignEvent(auction:Auction){
        self.auction = auction
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }
}