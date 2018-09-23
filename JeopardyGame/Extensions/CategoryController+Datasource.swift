//
//  CategoryController+Datasource.swift
//  JeopardyGame
//
//  Created by Nhan Nguyen on 9/21/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

import UIKit

extension CatergoryController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.result.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "category", for: indexPath)
        let finalCategory = self.result
        cell.textLabel?.text = finalCategory[indexPath.row].title
        
        return cell
    }
}
