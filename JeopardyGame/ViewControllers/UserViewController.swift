//
//  ViewController.swift
//  JeopardyGame
//
//  Created by Nhan Nguyen on 9/21/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBAction func startButton(_ sender: Any) {
        Username.userName = userName.text!
    }
    
    @IBAction func leaderboardButton(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftButton
        
    }
}

