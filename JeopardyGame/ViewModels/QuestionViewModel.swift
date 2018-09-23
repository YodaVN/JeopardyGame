//
//  QuestionViewModel.swift
//  JeopardyGame
//
//  Created by Nhan Nguyen on 9/21/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

import Foundation

class QuestionViewModel {
    
    static let shared = QuestionViewModel()
    var questions: [StoreQuestions] = []
    var categorySpecific: CategorySpecific? = nil
    
    /// Function for the request of the question items.
    func fetchQuestions(categoryID: Int, completionHanlder: @escaping (_ jsonData: [StoreQuestions] ) -> Void) {
        let url = URL(string: "http://jservice.io/api/category?id=\(categoryID)")!
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            
            guard let data = data else {
                return
            }

            guard let questionsArray = try? jsonDecoder.decode(CategorySpecific.self, from: data) else {
                return
            }
            
            for question in questionsArray.clues {
                self.questions.append(question)
            }
            
            completionHanlder(self.questions)
        }.resume()
    }
}
