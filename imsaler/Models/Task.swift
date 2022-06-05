//
//  Task.swift
//  imsaler
//
//  Created by Mykola on 20.05.2022.
//

import Foundation
import Firebase

struct Task {
    let title: String
    let userId: String
    let ref: DatabaseReference?
    var completed: String
    /*enum status {
        case done
        case inProgress
        case inSearch
        case draft
    }*/
    
    init(title: String, userId: String, completed: String){
        self.title = title
        self.userId = userId
        self.ref = nil
        self.completed = completed
    }
    
    init (snapshot: DataSnapshot){
        let snapshotValue = snapshot.value as! [String: AnyObject]
        title = snapshotValue["title"] as! String
        userId = snapshotValue["userId"] as! String
        completed = snapshotValue["completed"] as! String
        ref = snapshot.ref
    }
    func convertToDictionary() -> Any {
        return ["title": title, "userId": userId, "completed": completed]
    }
}
