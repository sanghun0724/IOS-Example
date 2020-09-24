//
//  ViewController.swift
//  MyLoginService
//
//  Created by sangheon on 2020/09/21.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func firstNextButton(_ sender:UIButton) {
        let vc = self.storyboard?.instantiateViewController(identifier: "secondVc")
        
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

