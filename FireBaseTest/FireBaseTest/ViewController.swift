//
//  ViewController.swift
//  FireBaseTest
//
//  Created by sangheon on 2020/11/17.
//
import FirebaseDatabase
import UIKit

class ViewController: UIViewController {
    
    private let database = Database.database().reference() //realtime database referece!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        database.observeSingleEvent(of: .value, with: {snapshot in
            guard let value = snapshot.value as? [String:Any] else {
                return
            }
            
            print("Value:\(value)")
        })

        let button = UIButton(frame: CGRect(x: 20, y: 200, width: view.frame.size.width-40, height: 50))
        button.setTitle("Add entry", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .link
        view.addSubview(button)
        button.addTarget(self, action: #selector(addNewEntry), for: .touchUpInside)
}
    @objc private func addNewEntry() {
        let object:[String:Any] = ["name":"iOS Academy" as NSObject,
                                      "Youtube":"yes"]
        database.child("something_\(Int.random(in: 0..<100))").setValue(object)
    }
}
