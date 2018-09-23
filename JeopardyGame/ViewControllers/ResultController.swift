//
//  ResultController.swift
//  JeopardyGame
//
//  Created by Nhan Nguyen on 9/21/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

import UIKit

class ResultController: UIViewController {
    var categoryID = 0

    @IBOutlet weak var resultTitle: UILabel!
    @IBOutlet weak var resultText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        calculate()
        
        
        let leftButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftButton
        
        let rightButton = UIBarButtonItem(title: "Upload", style: .plain, target: self, action: #selector(self.uploadFirebase))
        self.navigationItem.rightBarButtonItem = rightButton
    }
    
    @objc func uploadFirebase() {
        Firebase.sharedInstance.uploadHighScoreToFIR(Username.userName, userScore)
        self.performSegue(withIdentifier: "backSegue", sender: self)
    }
    
    func calculate() {        
        var title = ""
        if(rightAnwsers < 2) {
            title = "You need to practice more buddy"
        } else if(rightAnwsers < 3) {
            title = "You are good"
        } else{
            title = "How can you do this?"
        }
        resultTitle.text = title
        resultText.text = "You got \(rightAnwsers) correct answer \n \n Your final score is \(userScore)\n"
    }
}
