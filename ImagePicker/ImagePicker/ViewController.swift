//
//  ViewController.swift
//  ImagePicker
//
//  Created by sangheon on 2020/09/17.
//  Copyright © 2020 sangheon. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UINavigationControllerDelegate, UIImagePickerControllerDelegate{
   
    lazy var imagePicker: UIImagePickerController = {
        let picker: UIImagePickerController = UIImagePickerController()
        picker.sourceType = .photoLibrary
        picker.delegate = self
        return picker
    }()

    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func touchUpSelectImageButton (_ sender:UIButton) {
        self.present(self.imagePicker, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let originalImage:UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            self.imageView.image = originalImage
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true, completion: nil)
    }
    }




