//
//  Question.swift
//  MathQuiz
//
//  Created by Emre ÖKTEM on 17.08.2021.
//

import Foundation

struct Question {
    
    enum Operation: Int {
        case sum = 1
        case multiply = 2
    }
    
    var a: Int = Int.random(in: 1...10)
    var b: Int = Int.random(in: 1...10)
    var operation: Operation
    var answers: [Int] = [Int]()
    var correctAnswer: Int
    
    init() {
        operation = Operation(rawValue: Int.random(in: 1...2))!
        
        switch operation {
        case .sum:
            answers.append(a + b)
            answers.append(a + b + Int.random(in: 3...6))
            answers.append(a + b - Int.random(in: 1...4))
            answers.append(a + b + 10)
            correctAnswer = a + b
        case .multiply:
            answers.append(a * b)
            answers.append(a * (b + 1))
            answers.append((a - 1) * b)
            answers.append(a + b - 1)
            correctAnswer = a * b
        }
        
        answers.shuffle()
        
    }
    
    var asString: String {
        switch operation {
        case .sum:
            return "\(a) + \(b)"
        case .multiply:
            return "\(a) x \(b)"
        }
    }
}
