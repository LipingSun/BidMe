//
//  AuctionTests.swift
//  tryleancloud
//
//  Created by Liping on 11/25/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import XCTest
@testable import BidMe

class AuctionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
//        Item.query().getFirstObjectInBackgroundWithBlock({(object: AnyObject?, error: NSError?) in
//            if (error == nil) {
//                let auction = Auction()
//                auction.item = object as? Item
//                auction.save()
//            }
//        })
        let item = Item()
        let auction = Auction()
        auction.item = item
        auction.save()
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
