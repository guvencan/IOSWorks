//
//  AnswersViewController.swift
//  MathQuiz
//
//  Created by Emre ÖKTEM on 17.08.2021.
//

import UIKit

class AnswersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Singleton.shared.list.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
               
        let cell: MyCustomCell = self.tableView.dequeueReusableCell(withIdentifier: "cell") as! MyCustomCell
        
        let result = Singleton.shared.list[indexPath.row]
        cell.title.text = "\(result.question)  =  \(result.answer)"
        cell.check.image = (result.isRight) ?  UIImage(named: "check") : UIImage(named: "cross")
        return cell
    }
    
    


    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
}
