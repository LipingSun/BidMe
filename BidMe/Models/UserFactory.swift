//
//  UserFactory.swift
//  LeanChatSwift
//
//  Created by lzw on 15/11/17.
//  Copyright © 2015年 LeanCloud. All rights reserved.
//

import UIKit

class UserFactory: NSObject, CDUserDelegate {
    func cacheUserByIds(userIds: Set<NSObject>!, block: AVBooleanResultBlock!) {
        block(true, nil)
    }
    
//    func getUserById(userId: String!) -> CDUserModel! {
//
//        let user = User(withoutDataWithObjectId: userId)
//        user.fetch()
//        let cdUser = CDUser()
//
//        cdUser.setUserId(user.objectId)
//        cdUser.setUsername(user.username)
//        cdUser.setAvatarUrl("http://ac-x3o016bx.clouddn.com/86O7RAPx2BtTW5zgZTPGNwH9RZD5vNDtPm1YbIcu")
//        return cdUser
//    }
    
    func getUserById(userId: String!) -> CDUserModel! {
        let user = CDUser()
        user.setUserId(userId)
        user.setUsername(userId)
        user.setAvatarUrl("http://ac-x3o016bx.clouddn.com/86O7RAPx2BtTW5zgZTPGNwH9RZD5vNDtPm1YbIcu")
        return user
    }

}
