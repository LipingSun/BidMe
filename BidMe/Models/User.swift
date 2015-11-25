//
//  User.swift
//  tryleancloud
//
//  Created by Liping on 11/25/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import UIKit
import AVOSCloud

class User: AVUser {
    
    // These variables are inherited from AVUser
    
    // var username: String!
    
    // var password: String!
    
    // var email: String!
    
    // var mobilePhoneNumber: String!
    
    @NSManaged var firstName: NSString?
    
    @NSManaged var lastName: NSString?
    
    @NSManaged var desc: NSString?
    
    override static func parseClassName() -> String! {
        return "_User"
    }
}