//  ViewController.swift
//  Astronomy Trivia
//
//  Created by Thomas Hill on 8/18/18.
//  Copyright © 2018 Computer Magic. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var progress = 0 {
        didSet {
            progressLabel.text = "\(progress)/\(numberOfQuestions)"
        }
    }
    var score = 0 {
        didSet {
            scoreLabel.text = "Score: \(score)"
        }
    }
    
    var allQuestions = QuestionBank()
    let numberOfQuestions = QuestionBank.init().list.count
    var currentQuestion = 0
    var pickedAnswer = false
    var trueEmoji = "👍 Correct!\n\r"
    var falseEmoji = "👎 Wrong - The Correct Answer is:\n\r"
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var trueButtonLabel: UIButton!
    @IBOutlet weak var falseButtonLabel: UIButton!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var explanationLabel: UILabel!
    @IBOutlet weak var nextQuestionButton: UIButton!
    @IBOutlet weak var questionContainer: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var displayImage: UIImageView!
    @IBOutlet weak var startOverButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        restartQuiz()
    }
    
    func restartQuiz() {
        currentQuestion = 0
        pickedAnswer = false
        progress = 0
        score = 0
        displayImage.isHidden = false
        questionContainer.backgroundColor = UIColor.white
        questionLabel.textAlignment = NSTextAlignment.natural
        questionLabel.font = questionLabel.font.withSize(20)
        questionLabel.textColor = UIColor.black
        nextQuestion()
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        
        if sender.tag == 1 {
            pickedAnswer = true
        }
        else if sender.tag == 2 {
            pickedAnswer = false
        }
        checkAnswer()
        displayAnswer()
    }
    
    @IBAction func nextQuestionButton(_ sender: UIButton) {
        currentQuestion += 1
        nextQuestion()
    }

    func nextQuestion() {
        if currentQuestion <= numberOfQuestions - 1 {
            displayImage.image = UIImage(named: String(allQuestions.list[currentQuestion].usedImage))
            displayImage.isHidden = false
            trueButtonLabel.isHidden = false
            falseButtonLabel.isHidden = false
            answerLabel.isEnabled = false
            questionLabel.textColor = UIColor.black
            questionContainer.backgroundColor = UIColor.white
            questionLabel.text = allQuestions.list[currentQuestion].question
            explanationLabel.isHidden = true
            nextQuestionButton.isHidden = true
            startOverButton.isHidden = false
            progress += 1
        }
        else {
            trueButtonLabel.isHidden = true
            falseButtonLabel.isHidden = true
            displayImage.isHidden = true
            nextQuestionButton.isHidden = true
            answerLabel.isEnabled = true
            answerLabel.isHidden = false
            startOverButton.isHidden = false
            questionContainer.backgroundColor = UIColor.white
            questionLabel.textAlignment = NSTextAlignment.center
            questionLabel.font = questionLabel.font.withSize(30)
            questionLabel.textColor = UIColor.red
            questionLabel.text = "Complete"
            answerLabel.text = "You have reached the end of the quiz. You answered \(score) of the \(numberOfQuestions) questions correctly.\n\nHopefully you learned somethings about astronomy using this quiz. If you'd like to re-enforce what you have learned, tap the \"Start Over\" link below to re-start the quiz."
        }
    }
    
    func checkAnswer() {
        if pickedAnswer == allQuestions.list[currentQuestion].correctAnswer {
            score += 1
            explanationLabel.text = "\(trueEmoji)\(allQuestions.list[currentQuestion].explanation)"
        }
        else {
            explanationLabel.text = "\(falseEmoji)\(allQuestions.list[currentQuestion].explanation)"
        }
    }
    
    func displayAnswer() {
        displayImage.isHidden = true
        trueButtonLabel.isHidden = true
        falseButtonLabel.isHidden = true
        questionLabel.textColor = UIColor.white
        questionContainer.backgroundColor = UIColor.gray
        answerLabel.isEnabled = true
        explanationLabel.isHidden = false
        nextQuestionButton.isHidden = false
    }
    
    @IBAction func startOver(_ sender: UIButton) {
        restartQuiz()
    }
    
}

