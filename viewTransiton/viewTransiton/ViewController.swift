//
//  ViewController.swift
//  viewTransiton
//
//  Created by sangheon on 2020/09/15.
//  Copyright © 2020 sangheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nameField:UITextField!
    @IBOutlet weak var ageField:UITextField!
    
    @IBAction func touchupSetButton(_ sender:UIButton){
        UserInformation.shared.name = nameField.text
        UserInformation.shared.name = ageField.text
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

