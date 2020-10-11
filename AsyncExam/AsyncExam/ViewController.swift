//
//  ViewController.swift
//  AsyncExam
//
//  Created by sangheon on 2020/10/10.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView:UIImageView!
    @IBAction func touchUpDownloadButton(_ sender: UIButton){
        
        //https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/LARGE_elevation.jpg/1600px-LARGE_elevation.jpg
        let imageURL:URL = URL(string: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3d/LARGE_elevation.jpg/1600px-LARGE_elevation.jpg)")!
        
        OperationQueue().addOperation { //백그라운드 
            let imageData: Data = try! Data.init(contentsOf: imageURL)
            let image:UIImage = UIImage(data: imageData)!
            
            OperationQueue.main.addOperation {  //메인
                self.imageView.image = image
            }
        }
      
    
       
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

