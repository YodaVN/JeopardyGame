//
//  TableViewCell.swift
//  JeopardyGame
//
//  Created by Nhan Nguyen on 9/21/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func set(username: String, scoreLabel: String){
        self.userNameLabel.text = username
        self.scoreLabel.text = scoreLabel
    }

}
