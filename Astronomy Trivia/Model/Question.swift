//
//  Question.swift
//  Astronomy Trivia
//
//  Created by Thomas Hill on 8/18/18.
//  Copyright © 2018 Computer Magic. All rights reserved.
//  

import Foundation

class Question {
    var question: String
    var explanation: String
    var correctAnswer: Bool
    var usedImage: String
    
    init(question: String, explanation: String, correctAnswer: Bool, usedImage: String) {
        self.question = question
        self.explanation = explanation
        self.correctAnswer = correctAnswer
        self.usedImage = usedImage
    }
}
