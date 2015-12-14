//
//  Item.swift
//  tryleancloud
//
//  Created by Liping on 11/25/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit
// import AVOSCloud

class Item: AVObject, AVSubclassing {
    
    @NSManaged var name: NSString?
    
    @NSManaged var desc: NSString?
    
    @NSManaged var picture: AVFile?
    
//    @NSManaged var pictures: [AVFile]?
    
    @NSManaged var owner: User?
    
    override init() {
        super.init()
    }
    
    init(name: NSString, desc: NSString, picture: AVFile, owner: User) {
        super.init()
        self.name = name
        self.desc = desc
        self.picture = picture
        self.owner = owner
    }
    
    static func parseClassName() -> String! {
        return "Item"
    }
}