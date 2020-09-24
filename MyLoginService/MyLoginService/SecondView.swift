//
//  SecondView.swift
//  MyLoginService
//
//  Created by sangheon on 2020/09/21.
//

import UIKit

class SecondView: UIViewController,UIImagePickerControllerDelegate ,UINavigationControllerDelegate ,UIGestureRecognizerDelegate{
    
    
    @IBOutlet weak var ID:UITextField!
    @IBOutlet weak var password:UITextField!
    @IBOutlet weak var password2:UITextField!
    @IBOutlet weak var bigText:UITextView!
    
    let alert = UIAlertController(title: "Sorry", message: "please do it again", preferredStyle: .alert)
    let defaultAction = UIAlertAction(title: "OK", style: .destructive) { (action) in
    }
    
    
    func check (_ t1:UITextField,_ t2:UITextField,_ ID:UITextField,_ big:UITextView)->Bool{
        if (t1.text?.count) == 0 || ((t2.text?.count) == 0) || ((ID.text?.count) == 0) || (big.text?.count) == 0   {
            return false
        }
        
        return true
    
    }
    
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func nextButton(_ sender: UIButton) {
        
        if self.check(self.ID, self.password, self.password2, self.bigText) == false {
            let alert = UIAlertController(title: "Sorry", message: "please do it again", preferredStyle: .alert)
            let deFaultAction = UIAlertAction(title: "OK", style: .destructive) { (action) in
            }
            alert.addAction(deFaultAction)
            
            
            present(alert, animated: true, completion: nil)
        
        }
            else {
                let vcName =
                    self.storyboard?.instantiateViewController(identifier: "thirdVc")
                    
                vcName?.modalTransitionStyle = .coverVertical
                self.present(vcName!, animated: true, completion: nil)
                          }
    }
    
    
    @IBAction func cancelButoon(_ sender: UIButton) {
        
    }
    
    
    
    @IBOutlet var imageView:UIImageView!
    


    
    
    lazy var imagePicker: UIImagePickerController =  {
        let picker:UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()



    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage:UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = originalImage
        }
        self.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tapGestureRecognizer)
        }

        @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer)
        {
            _ = tapGestureRecognizer.view as! UIImageView
            present(self.imagePicker, animated: true, completion: nil)
            
           
        }

         
       
            }

        
        
        // Do any additional setup after loading the view.
    
    


