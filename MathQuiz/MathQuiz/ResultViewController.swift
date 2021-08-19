//
//  ResultViewController.swift
//  MathQuiz
//
//  Created by Emre ÖKTEM on 17.08.2021.
//

import UIKit

class ResultViewcontroller: UIViewController {
    
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblScore: UILabel!
    
    var name: String?
    var score: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lblName.text = name ?? ""
        
//        if let s = score {
//            lblScore.text = "\(s)"
//        } else {
//            lblScore.text = ""
//        }
        
        lblScore.text = score != nil ? "\(score!)" : ""
        
    }
    
    @IBAction func playAgainClicked(_ sender: Any) {
        
        if let vc = UIStoryboard.createViewController(fromStoryboard: "Main", forViewcontroller: .start) as? ViewController {
            self.navigationController?.replaceCurrentView(withViewController: vc)
        }
        
    }
    
    @IBAction func showAnswersClicked(_ sender: Any) {
        
        if let vc = UIStoryboard.createViewController(fromStoryboard: "Main", forViewcontroller: .answers) as? AnswersViewController {
            self.present(vc, animated: true, completion: nil)
        }
    }
    
}
