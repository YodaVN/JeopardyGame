//
//  QuestionController.swift
//  JeopardyGame
//
//  Created by Nhan Nguyen on 9/21/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

import UIKit

class QuestionController: UIViewController {
    var storeQuestions = [StoreQuestions]()
    var id: Int?

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var sumitButton: UIButton!
    
    @IBAction func submitButton(_ sender: Any) {
        sumitButton.isEnabled = false
        
        let userAnwser = answerField.text!
        print(userAnwser)
        
        let currentAnswer = storeQuestions[questionIndex].answer
        print(currentAnswer)
        
        if userAnwser == currentAnswer {
            
            let valueScore = storeQuestions[questionIndex].value
            
            rightAnwsers += 1
            
            if valueScore != nil {
                userScore += valueScore
            }
                // else add zero
            else {
                userScore += 0
            }
            
            navigationItem.title = "That's correct!"
            self.questionLabel.text = "This is correct answer"
            self.calculateScore()
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.nextQuestion()
                self.sumitButton.isEnabled = true
            }
            
        }
        else {
            if userAnwser.lowercased().contains(currentAnswer) {
                navigationItem.title = ""
                self.questionLabel.text = "You are almost right, the correct answer is '\(currentAnswer)'."
            }
            else if userAnwser != currentAnswer {
                navigationItem.title = "Wrong"
                self.questionLabel.text = "The correct anwser is '\(currentAnswer)'."
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                self.nextQuestion()
            }
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("NHAN", Username.userName)
        
        guard let categoryID = self.id else {
            return self.id = 0
        }
        
        questionIndex = 0
        userScore = 0
        questionRounds = 5
        rightAnwsers = 0
        
        let getDataJSON = { (jsonData: [StoreQuestions]) -> Void in
            self.storeQuestions = jsonData
            DispatchQueue.main.async {
                self.storeQuestions = self.storeQuestions + self.storeQuestions
                self.updateUI(with: self.storeQuestions)
            }
        }
        let vm = QuestionViewModel()
        vm.fetchQuestions(categoryID: categoryID, completionHanlder: getDataJSON)
    }
    
    func updateUI(with storeQuestions: [StoreQuestions]) {
        DispatchQueue.main.async {
            self.showQuestion(with: storeQuestions)
            self.calculateScore()
        }
    }
    
    func nextQuestion() {
        answerField.text = ""
        questionIndex += 1
        
        if questionIndex < questionRounds {
            updateUI(with: storeQuestions)
        }
        
        else {
            performSegue(withIdentifier: "ResultsSegue", sender: nil)
        }
    }
    
    func showQuestion(with storeQuestions: [StoreQuestions]) {
        self.sumitButton.isEnabled = true
        
        navigationItem.title = "Question #\(questionIndex+1)"
        var currentQuestion = storeQuestions[questionIndex].question
        
        if currentQuestion == ""
        {
            currentQuestion = storeQuestions[questionIndex+1].question
        }
        else {
            questionLabel.text = currentQuestion
        }
    }
    
    func calculateScore() {
        scoreLabel.text = "Score: " + String(userScore)
        print(scoreLabel)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ResultsSegue" {
            let resultsViewController = segue.destination as! ResultController
        }
    }
}
