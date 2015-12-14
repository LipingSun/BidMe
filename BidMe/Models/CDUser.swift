//
//  CDUser.swift
//  BidMe
//
//  Created by Liping on 12/9/15.
//  Copyright © 2015 CMPE277. All rights reserved.
//

import Foundation

class CDUser: NSObject, CDUserModel {
    private var _username: String!
    private var _userId: String!
    private var _avatarUrl: String!
    
    func username() -> String! {
        return _username
    }
    
    func userId() -> String! {
        return _userId
    }
    
    func avatarUrl() -> String! {
        return _avatarUrl
    }
    
    func setUsername(username: String!) {
        _username = username
    }
    
    func setUserId(userId: String!) {
        _userId = userId
    }
    
    func setAvatarUrl(avatarUrl: String!) {
        _avatarUrl = avatarUrl
    }
}
