//
//  ProductData.swift
//  BidMe
//
//  Created by xiaoxiao li on 11/23/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit

class Product  {
    var name: String
    var startTime: String?
    var endTime: String?
    var startPrice: Int?
    var myPrice: Int
    var photo: UIImage?
    
    // MARK: Initialization
    
    init?(name: String, photo: UIImage?, endTime: String, myPrice: Int) {
        // Initialize stored properties.
        self.name = name
        self.photo = photo
        self.endTime = endTime
        self.myPrice = myPrice
    }

}