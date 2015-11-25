//
//  ItemTests.swift
//  tryleancloud
//
//  Created by Liping on 11/25/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import XCTest
@testable import BidMe

class ItemTests: XCTestCase {

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
        let item = Item()
        item.name = "item1"
        item.desc = "This is item1"
        item.save()
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }

}
