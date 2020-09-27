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
    @IBOutlet weak var phoneNuberText:UITextField!
   
    func check2(phoneNumber:UITextField,Label:UILabel) ->Bool {
        if (phoneNumber.text?.count) == 0 || (Label.text) == nil{
           return false
        }
            return true
    
        }
    
    
    @IBAction func lastCancelButton(_ sender:UIButton){
        self.navigationController?.popToRootViewController(animated: true)
    }
    @IBAction func backButton(_ sender:UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func signUp(_ sender:UIButton){
        if(check2(phoneNumber: phoneNuberText, Label: dateLabel)) == false {
            let alert = UIAlertController(title: "Sorry", message: "please do it again", preferredStyle: .alert)
            let deFaultAction = UIAlertAction(title: "OK", style: .destructive) { (action) in
            }
            alert.addAction(deFaultAction)
            present(alert, animated: true, completion: nil)
        
        }
            else  {
                 
                
                self.navigationController?.popToRootViewController(animated: true)
                }
                print("something wrong")
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

