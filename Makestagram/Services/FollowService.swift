//
//  FollowService.swift
//  Makestagram
//
//  Created by Brian Sakhuja on 6/29/17.
//  Copyright © 2017 Brian Sakhuja. All rights reserved.
//

import Foundation
import FirebaseDatabase

struct FollowService {
    
    
    
    
}



//private static func followUser(_ user: User, forCurrentUserWithSuccess success: @escaping (Bool) -> Void) {
//    // 1
//    let currentUID = User.current.uid
//    let followData = ["followers/\(user.uid)/\(currentUID)" : true,
//                      "following/\(currentUID)/\(user.uid)" : true]
//    
//    // 2
//    let ref = Database.database().reference()
//    ref.updateChildValues(followData) { (error, _) in
//        if let error = error {
//            assertionFailure(error.localizedDescription)
//        }
//        
//        // 3
//        success(error == nil)
//    }
//}