//
//  ViewController.swift
//  MathQuiz
//
//  Created by Emre ÖKTEM on 17.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var cardView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cardView.layer.cornerRadius = 10.0
        
        cardView.layer.shadowColor = UIColor.black.cgColor
        cardView.layer.shadowOpacity = 0.5
        cardView.layer.shadowOffset = CGSize(width: 10, height: 10)
        cardView.layer.shadowRadius = 10
        
        //TODO: Remove
        tfName.text = "Emre"
        
    }

    @IBAction func startClicked(_ sender: Any) {
        if tfName.text == "" {
            showAlert()
        } else {
            startGame()
        }
    }
    
    private func showAlert () {
        let alert = UIAlertController(title: "Error", message: "Please enter your name", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    private func startGame () {
        if let vc = UIStoryboard.createViewController(fromStoryboard: "Main", forViewcontroller: .quiz) as? QuizViewController {
            vc.name = tfName.text
            Singleton.shared.list = []
            self.navigationController?.replaceCurrentView(withViewController: vc)
        }
    }

}

