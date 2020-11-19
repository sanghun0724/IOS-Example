//
//  ViewController.swift
//  segmentControl
//
//  Created by sangheon on 2020/11/19.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var control:UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func didchageSegment(_ sender:UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            
        }
        if sender.selectedSegmentIndex == 1 {
            view.backgroundColor = .red
        }
        if sender.selectedSegmentIndex == 2 {
            view.backgroundColor = .black
        }
        if sender.selectedSegmentIndex == 3 {
            view.backgroundColor = .blue
        }
        if sender.selectedSegmentIndex == 4 {
            view.backgroundColor = .brown
        }
        
    }

}

