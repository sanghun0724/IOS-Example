//
//  ThirthView.swift
//  MyLoginService
//
//  Created by sangheon on 2020/09/21.
//

import UIKit

class ThirhView: UIViewController {
    
    @IBOutlet weak var datePicker:UIDatePicker!
    @IBOutlet weak var dateLabel:UILabel!
    
    @IBAction func lastCancelButton(_ sender:UIButton){
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func backButton(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func signUp(_ sender:UIButton){
        
    }
    let dateFormatter:DateFormatter = {
        let formatter:DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        return formatter
    }()
    @IBAction func datePickerValueChage(_ sender:UIDatePicker){
        let date:Date = self.datePicker.date
        let dateString:String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text  = dateString
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
