//
//  ViewModel.swift
//  JeopardyGame
//
//  Created by Nhan Nguyen on 9/21/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

import Foundation

class ViewModel {
    var stateInfo: [Category] = []
    
    func getCategoryData(urlJSONString: String, completionHanlder: @escaping (_ jsonData: [Category] ) -> Void) {
        guard let url = URL(string: urlJSONString) else {
            return
        }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            
            guard let data = data else {
                return
            }
            
            guard let category = try? jsonDecoder.decode([Category].self, from: data) else {
                return
            }
            
            for result in category {
                let category = Category(id: result.id, title: result.title, clues_count: result.clues_count)
                self.stateInfo.append(category)
            }
            completionHanlder(self.stateInfo)
        }.resume()
    }
}
