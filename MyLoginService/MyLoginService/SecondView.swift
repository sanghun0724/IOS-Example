//
//  SecondView.swift
//  MyLoginService
//
//  Created by sangheon on 2020/09/21.
//

import UIKit

class SecondView: UIViewController,UIImagePickerControllerDelegate ,UINavigationControllerDelegate ,UIGestureRecognizerDelegate{
    
    //MARK: Outlet
    @IBOutlet weak var ID:UITextField!
    @IBOutlet weak var password:UITextField!
    @IBOutlet weak var password2:UITextField!
    @IBOutlet weak var bigText:UITextView!
    @IBOutlet var imageView:UIImageView!
  
    
    //MARK: Alert
    let alert = UIAlertController(title: "Sorry", message: "please do it again", preferredStyle: .alert)
    let defaultAction = UIAlertAction(title: "OK", style: .destructive) { (action) in
    }
    
    // MARK:- Method
    // 각종 필요한 칸들 다채웠는지 체크하는 메소드!
    func check (_ t1:UITextField,_ t2:UITextField,_ ID:UITextField,_ big:UITextView)->Bool{
        if (t1.text?.count) == 0 || ((t2.text?.count) == 0) || ((ID.text?.count) == 0) || (big.text?.count) == 0 || self.imageView.image == nil || t1.text != t2.text {
            return false
        }
        
        return true
    
    }
    
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    //MARK: Action Button
    @IBAction func nextButton(_ sender: UIButton) {
        //필요한 값들이 없을 경우 Alert로 버튼 비활성화와 경고메세지!
        if self.check(self.password, self.password2, self.ID, self.bigText) == false {
            let alert = UIAlertController(title: "Sorry", message: "please do it again", preferredStyle: .alert)
            let deFaultAction = UIAlertAction(title: "OK", style: .destructive) { (action) in
            }
            alert.addAction(deFaultAction)
            
            
            present(alert, animated: true, completion: nil)
        }
           //값을 제대로 다 채웠을 경우 singltone pattern 을 이용한 UserInformatin에 아이디와 패스워드 저장!
            // 그리고 네비게이션으로 다음 뷰로 Push
            else {
                UserInformation.shared.ID = self.ID.text
                UserInformation.shared.Password = self.password.text
                let vcName =
                   self.storyboard?.instantiateViewController(identifier: "thirdVc")
//
//                vcName?.modalTransitionStyle = .coverVertical
//                self.present(vcName!, animated: true, completion: nil)
                self.navigationController?.pushViewController(vcName!, animated: true)
                
                          }
    }
    @IBAction func cancelButoon(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    
    }
    
    
   
    
    //MARK: imagePciker
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
    
    
     //gesture을 활용
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
    
    


