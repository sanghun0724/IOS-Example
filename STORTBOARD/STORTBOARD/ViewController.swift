//
//  ViewController.swift
//  STORTBOARD
//
//  Created by sangheon on 2020/09/13.
//  Copyright © 2020 sangheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet weak var button:UIButton!
    @IBOutlet weak var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        button.translatesAutoresizingMaskIntoConstraints = false
        //오토레이아웃 충돌하지 않기 위해!
        var constrainX: NSLayoutConstraint
        constrainX = button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        var constrainY: NSLayoutConstraint
               constrainY = button.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        //앵커 컨트롤러의 뷰의 중앙에 기준잡기
        constrainX.isActive = true
        constrainY.isActive = true //   제약 적용하기위해 활성화
        
        label.translatesAutoresizingMaskIntoConstraints = false
        //오토레이아웃 충돌하지 않기 위해!
        var buttonConstrainX: NSLayoutConstraint
        buttonConstrainX = label.centerXAnchor.constraint(equalTo: button.centerXAnchor)
        
        var TopConstrainY: NSLayoutConstraint
        TopConstrainY = label.bottomAnchor.constraint(equalTo: button.topAnchor,constant: -10)
        //앵커 컨트롤러의 뷰의 중앙에 기준잡기
        buttonConstrainX.isActive = true
        TopConstrainY.isActive = true //
    }


}

