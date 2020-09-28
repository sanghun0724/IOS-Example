//
//  ThirthView.swift
//  MyLoginService
//
//  Created by sangheon on 2020/09/21.
//

import UIKit

class ThirhView: UIViewController {
    //MARK: Outlet
    @IBOutlet weak var datePicker:UIDatePicker!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var phoneNuberText:UITextField!
    var ar:ViewController = ViewController()
   
    //MARK: Method
    func check2(phoneNumber:UITextField,Label:UILabel) ->Bool {
        if (phoneNumber.text?.count) == 0 || (Label.text) == nil{
           return false
        }
            return true
    
        }
    
    //MARK: Action Button
    @IBAction func lastCancelButton(_ sender:UIButton){
        UserInformation.shared.ID = nil
        UserInformation.shared.Password = nil
        
        
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
        
    //MARK: DatePicker
    
    let dateFormatter:DateFormatter = {
        let formatter:DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        

        return formatter}()
    @IBAction func datePickerValueChage(_ sender:UIDatePicker){
        let date:Date = self.datePicker.date
        let dateString:String = self.dateFormatter.string(from: date)
        self.datePicker.datePickerMode = .date
        self.dateLabel.text  = dateString
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        datePicker.preferredDatePickerStyle = .automatic
    }
}

