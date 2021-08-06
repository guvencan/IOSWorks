//
//  ViewController.swift
//  dice
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 6.08.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var dice: UIImageView!
    let images = ["1_dot", "2_dots", "3_dots", "4_dots", "5_dots", "6_dots"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func rollTouch(_ sender: Any) {
        let number = Int.random(in: 0...images.count-1)
        dice.image = UIImage(named: images[number])
        print(images[number])
    }
    
    
}
