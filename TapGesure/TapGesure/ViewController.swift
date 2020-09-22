//
//  ViewController.swift
//  TapGesure
//
//  Created by sangheon on 2020/09/20.
//

import UIKit

class ViewController: UIViewController , UIGestureRecognizerDelegate{

    @IBAction func tapView(_ sender:UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    @IBAction func ttttt(_sender:UITapGestureRecognizer){
        print("gkgk")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        let tapGesture:UITapGestureRecognizer =
//            UITapGestureRecognizer(target: self, action: #selector(self.tapView(_:)))
//
//        self.view.addGestureRecognizer(tapGesture)   //   코드로 제스쳐 구현
//
        let tapGesture: UITapGestureRecognizer = UITapGestureRecognizer()
        tapGesture.delegate = self
        
        self.view.addGestureRecognizer(tapGesture)
    }
//밑은 딜리게이트 활용
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        //이 메소드에서 bool 부분은 차피  트루하든 폴스하든 물어본순간 사용자가 클릭! 액션한거니깐 무상관
        self.view.endEditing(true)
        return true
    }
    

}

