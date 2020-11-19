//
//  ViewController.swift
//  AlamoFireTest
//
//  Created by sangheon on 2020/11/19.
//

import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


    @IBAction func onBtnRequest(_ sender: Any) {
        
    }
    
    func sendRequest() {
        //post 방식
        let parameter :Parameters = [
            "user_id" : "hong",
            "user_pw" : "1234"
        ]
        let url:String = "http://nissisoft21.dothome.co.kr/login_test.php"
        
        
        Alamofire.request(url,
                          method: .post,
                          parameter: parameter,
                          encoding: URLEncoding.httpBody,
                          headers: [
                          
                          ]
        )
                          
    }
    

}

