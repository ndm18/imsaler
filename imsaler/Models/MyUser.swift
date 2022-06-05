//
//  User.swift
//  imsaler
//
//  Created by Mykola on 20.05.2022.
//

import Foundation
import Firebase

struct MyUser {
    let uid: String
    let email: String
    //let password: String
    init(user: User){
        self.uid = user.uid
        self.email = user.email!
    }
}
