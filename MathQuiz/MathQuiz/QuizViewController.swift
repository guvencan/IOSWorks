//
//  QuizViewController.swift
//  MathQuiz
//
//  Created by Emre ÖKTEM on 17.08.2021.
//

import UIKit

class QuizViewController: UIViewController {
    
    @IBOutlet weak var lblQuestionNumber: UILabel!
    @IBOutlet weak var lblQuestion: UILabel!
    
    @IBOutlet weak var btnAnswer1: UIButton!
    @IBOutlet weak var btnAnswer2: UIButton!
    @IBOutlet weak var btnAnswer3: UIButton!
    @IBOutlet weak var btnAnswer4: UIButton!
    
    var name: String?
    
    var questions = [Question]()
    var currentQuestionIndex: Int = 0
    var numberOfCorrectAnswers: Int = 0
    
    private var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0..<10 {
            questions.append(Question())
        }
        
        showQuestion()
    }
    
    private func showQuestion () {
        lblQuestionNumber.text = "Question \(currentQuestionIndex + 1) of \(questions.count)"
        
        lblQuestion.text = currentQuestion.asString
        btnAnswer1.setTitle("\(currentQuestion.answers[0])", for: .normal)
        btnAnswer2.setTitle("\(currentQuestion.answers[1])", for: .normal)
        btnAnswer3.setTitle("\(currentQuestion.answers[2])", for: .normal)
        btnAnswer4.setTitle("\(currentQuestion.answers[3])", for: .normal)
    }
    
    @IBAction func answerClicked(_ sender: UIButton) {
        
        var result = Result(id: currentQuestionIndex, question: currentQuestion.asString, answer: sender.currentTitle ?? "", isRight: false)
        
        if currentQuestion.answers[sender.tag] == currentQuestion.correctAnswer { //Correct
            numberOfCorrectAnswers += 1
            result.isRight = true
        } else { //Wrong answer
            result.isRight = false
        }
        
        Singleton.shared.list.append(result)
        
        
        currentQuestionIndex += 1
        
        if currentQuestionIndex < questions.count {
            showQuestion()
        } else {
            gameOver()
        }
    }
    
    private func gameOver () {
        if let vc = UIStoryboard.createViewController(fromStoryboard: "Main", forViewcontroller: .result) as? ResultViewcontroller {
            vc.name = name
            vc.score = numberOfCorrectAnswers
            self.navigationController?.replaceCurrentView(withViewController: vc)
        }
    }
}
