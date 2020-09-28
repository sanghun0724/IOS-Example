//
//  ViewController.swift
//  MyLoginService
//
//  Created by sangheon on 2020/09/21.
//

import UIKit

class ViewController: UIViewController {
    //MARK: Outlet
    @IBOutlet weak var firstId:UITextField?
    @IBOutlet weak var firstPassword:UITextField?
    
    //MARK: Action
    @IBAction func firstNextButton(_ sender:UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "secondVc")
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.firstId?.text = UserInformation.shared.ID
        self.firstPassword?.text = UserInformation.shared.Password
       
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 앱경험이 많이 없어 스파게티 코드라 가독성이 안좋을거에요 죄송합니다ㅠㅠㅠ  노력하겠습니다
    }
    
}

