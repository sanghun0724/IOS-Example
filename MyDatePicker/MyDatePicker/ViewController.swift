//
//  ViewController.swift
//  MyDatePicker
//
//  Created by sangheon on 2020/09/20.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var datePicker:UIDatePicker!
    @IBOutlet weak var dateLabel:UILabel!
    let dateFormatter: DateFormatter = {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .medium
        //자기맘대로 formatter.dateFormat =  "yyyy/MM/dd hh:mm:ss"
        return formatter
    }()
    @IBAction func didDatePickerValueChanged(_ sender:UIDatePicker){ //sender은 메소드를호출한친구
        print("value change")
        
        let date:Date = self.datePicker.date
        let dateString: String = self.dateFormatter.string(from: date)
        
        self.dateLabel.text = dateString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.datePicker.addTarget(self, action: #selector(self.didDatePickerValueChanged(_:)), for: UIControl.Event.valueChanged)  // 위에 인터페이스 빌더 대신 코드로 밸류체잉지 감지
    }
    
    


}

