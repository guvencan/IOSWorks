//
//  ViewController.swift
//  DatePicker
//
//  Created by Guvencan Karpat [Bireysel Mobil Bankacilik Squad 2] on 10.08.2021.
//

import UIKit

class ViewController: UIViewController {
    
    private var result = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Doğum gününden sonra kaç gün geçti
        
        //Label
        let title = UILabel()
        title.text = "REMAINING DAYS \r\n CALCULATOR"
        title.numberOfLines = 2
        title.textAlignment = NSTextAlignment.center
        title.font = UIFont.boldSystemFont(ofSize: 28.0)
        view.addSubview(title)
        title.anchor(
             top: view.topAnchor,
             paddingTop: 80,
             bottom: nil,
             paddingBottom: 0,
             left: view.leftAnchor,
             paddingLeft: 0,
             right: view.rightAnchor,
             paddingRight: 0,
             width: 0,
             height: 72)
        
        

        //Datepicker
        let picker = UIDatePicker()
        picker.preferredDatePickerStyle = .inline
        picker.datePickerMode = .date
        picker.minimumDate = Date()
        picker.addTarget(self, action: #selector(datePickerSelected), for: UIControl.Event.valueChanged)
        view.addSubview(picker)
        picker.anchor(
             top: title.bottomAnchor,
             paddingTop: 40,
             bottom: nil,
             paddingBottom: 0,
             left: view.leftAnchor,
             paddingLeft: 0,
             right: view.rightAnchor,
             paddingRight: 0,
             width: 0,
             height: 0)

        
        //Result
        result.textAlignment = NSTextAlignment.center
        result.font = UIFont.systemFont(ofSize: 18.0)
        view.addSubview(result)
        result.anchor(
            top: picker.bottomAnchor,
            paddingTop: 80,
            bottom: nil,
            paddingBottom: 0,
            left: view.leftAnchor,
            paddingLeft: 0,
            right: view.rightAnchor,
            paddingRight: 0,
            width: 0,
            height: 0)
        
        
        
        
    }
    
    @objc func datePickerSelected(picker: UIDatePicker){
      
        let calendar = Calendar.current
        let selectedDate = calendar.startOfDay(for: picker.date)
        let diff = calendar.dateComponents([.day, .hour], from: Date(), to: selectedDate)

        guard var diffDay = diff.day as Int? else {
            return
        }
        diffDay += 1
        
        result.text = "\(diffDay) days left"
   
        
    }
    
}

