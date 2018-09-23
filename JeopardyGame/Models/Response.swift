//
//  Category.swift
//  JeopardyGame
//
//  Created by Nhan Nguyen on 9/21/18.
//  Copyright © 2018 Nhan Nguyen. All rights reserved.
//

import Foundation

struct Category: Decodable {
    let id: Int
    let title: String
    let clues_count: Int
    
    init(id: Int, title: String, clues_count: Int) {
        self.id = id
        self.title = title
        self.clues_count = clues_count
    }
}

struct CategorySpecific: Decodable {
    let id: Int
    let title: String
    let clues_count: Int
    let clues: [StoreQuestions]
}

struct StoreQuestions: Decodable {
    let id: Int
    let answer: String
    let question: String
    let value: Int
    let airdate: String
    let category_id: Int
    let game_id: Game_id
    let invalid_count: Invalid_count
}

var questionIndex = 0

var userScore = 0

var questionRounds = 5

var lives = 4

var rightAnwsers = 0

struct Username {
    static var userName = "test"
}
