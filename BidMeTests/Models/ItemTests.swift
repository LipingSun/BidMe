//
//  ItemTests.swift
//  tryleancloud
//
//  Created by Liping on 11/25/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import XCTest
import AVOSCloud

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
        let expectation = expectationWithDescription("longRunningFunction")
        
//        AVUser.logInWithUsernameInBackground("user1", password: "123123", block: ({(user: AVUser?, error: NSError?) in
//            if let user = user as? User {
//                print("login success!")
//                
//                let pic = AVFile(name: "item2.jpg", data: UIImageJPEGRepresentation(UIImage(named: "item2")!, 0.5))
//                pic.saveInBackgroundWithBlock({(succeeded: Bool, error: NSError?) in
//                    let item = Item(name: "item3", desc: "This is item3", picture: pic, owner: user)
//                    item.pictures = [pic]
//                    item.saveInBackgroundWithBlock({(succeeded: Bool, error: NSError?) in
//                        expectation.fulfill()
//                    })
//                })
//
//            } else {
//                print("login failed!")
//            }
//            
//        }))
        
        
        let itemQuery = Item.query()
        itemQuery.includeKey("pictures")
        let item = itemQuery.getObjectWithId("565d61bd60b294bce58b9244") as! Item
//        print(item.pictures![0].objectId)
        
        let image = UIImage(data: item.picture.getData())
        
        self.waitForExpectationsWithTimeout(15) { error in
            
//            print(error);
            
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measureBlock {
            // Put the code you want to measure the time of here.
        }
    }
    
}
