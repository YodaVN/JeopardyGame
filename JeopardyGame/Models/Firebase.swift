//
//  Firebase.swift
//  JeopardyGame
//
//  Created by Michael deBoisblanc on 9/21/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

import Foundation
import Firebase

class Firebase{
    
    static let sharedInstance = Firebase()
    
    static var users = [User]()
    let ref = Database.database().reference()
    
    func uploadHighScoreToFIR(_ username: String, _ highScore: Int){
        let refp = ref.child("Scores").childByAutoId()
        let refa = refp.child("High Score")
        refa.setValue(highScore)
        let reft = refp.child("Username")
        reft.setValue(username)
    }
    
    func loadHighScore(){
        ref.child("Scores").observe(.childAdded, with: { (snapshot)
            in
            let dictionary = snapshot.value as? [String: AnyObject] ?? [:]
            print("dictionary: \(dictionary)")
            let username = dictionary["Username"] as? String ?? ""
            let score = dictionary["High Score"] as? Int ?? 0
            let user = User(username: username, highScore: score)
            Firebase.users.append(user)
        }, withCancel: {(err) in
            print("Error downloading profile: \(err)")
        })
    }
}
