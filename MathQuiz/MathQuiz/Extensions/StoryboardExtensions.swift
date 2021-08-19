//
//  StoryboardExtensions.swift
//  MathQuiz
//
//  Created by Emre ÖKTEM on 17.08.2021.
//

import UIKit

extension UIStoryboard {
    
    static func createViewController (fromStoryboard storyboardName: String, forViewcontroller type: ViewControllerType) -> UIViewController {
        
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: type.rawValue)
        
    }
    
}

enum ViewControllerType: String {
    case quiz = "quiz"
    case result = "result"
    case start = "main"
    case answers
}
