//
//  CatergoryController.swift
//  JeopardyGame
//
//  Created by Nhan Nguyen on 9/21/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

import UIKit

class CatergoryController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var result: [Category] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        let getDataJSON = { (jsonData: [Category]) -> Void in
            self.result = jsonData
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        let vm = ViewModel()
        vm.getCategoryData(urlJSONString: "http://jservice.io/api/categories?count=20", completionHanlder: getDataJSON)
    }
}
