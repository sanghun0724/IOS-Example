//
//  secondViewController.swift
//  viewTransiton
//
//  Created by sangheon on 2020/09/15.
//  Copyright © 2020 sangheon. All rights reserved.
//

import UIKit

class secondViewController: UIViewController {
   
    @IBOutlet weak var nameLebel:UILabel!
    @IBOutlet weak var ageLaber:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Do any additional setup after loading the view.
    }
     override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        self.nameLebel.text = UserInformation.shared.name
        self.ageLaber.text = UserInformation.shared.age
        
    }
    @IBAction func popToPrev() {
        self.navigationController?.popViewController(animated: true)
    }
    @IBAction func dissmissModal() {
        self.dismiss(animated: true, completion: nil)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
