//
//  ViewController.swift
//  LoginFireBase
//
//  Created by sangheon on 2020/11/17.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController {
    
    private let label:UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 24 ,weight: .semibold)
        label.text = "Log In"
        return label
    }()
    
    private let emailField:UITextField = {
        let emailField = UITextField()
        emailField.placeholder = "Email Address"
        emailField.layer.borderWidth = 1
        emailField.layer.borderColor = UIColor.black.cgColor
        emailField.backgroundColor = .white
        emailField.autocapitalizationType = .none //첫번째 문자 항상 소문자
        emailField.leftViewMode = .always
        emailField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return emailField
    }()
    private let passwordFiled:UITextField = {
        let passField = UITextField()
        passField.placeholder = "Password"
        passField.layer.borderWidth = 1
        passField.isSecureTextEntry = true
        passField.layer.borderColor = UIColor.black.cgColor
        passField.backgroundColor = .white
        passField.leftViewMode = .always
        passField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: 0))
        return passField
    }()
    
    private let button:UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        return button
        
    }()
    
    private let signOutButton:UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemGreen
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Log Out", for: .normal)
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.addSubview(label)
        view.addSubview(emailField)
        view.addSubview(passwordFiled)
        view.addSubview(button)
        view.backgroundColor = .systemPurple
        
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        if FirebaseAuth.Auth.auth().currentUser != nil {
            label.isHidden = true
            emailField.isHidden = true
            passwordFiled.isHidden = true
            button.isHidden = true
            
            view.addSubview(signOutButton)
            signOutButton.frame = CGRect(x: 20, y: 150, width: view.frame.size.width-40, height: 52)
            signOutButton.addTarget(self, action: #selector(logOutTapped), for: .touchUpInside)
        }
    }
    
    @objc private func logOutTapped() {
        do {
            try FirebaseAuth.Auth.auth().signOut()
            
            label.isHidden = false
            emailField.isHidden = false
            passwordFiled.isHidden = false
            button.isHidden = false
            signOutButton.isHidden = true
        }
        catch {
            print("An error occured")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        label.frame = CGRect(x: 0, y: 100, width: view.frame.size.width, height: 50)
        
        emailField.frame = CGRect(x: 20, y: label.frame.origin.y+label.frame.size.height+10, width: view.frame.size.width-40,
                                  height: 50)
        
        passwordFiled.frame = CGRect(x: 20,
                                     y: emailField.frame.origin.y+emailField.frame.size.height+10,
                                     width: view.frame.size.width-40,
                                     height: 50)
        
        button.frame = CGRect(x: 20, y: passwordFiled.frame.origin.y+passwordFiled.frame.size.height+30, width: view.frame.size.width-40, height: 52)
        
    }
    
    @objc private func didTapButton()  {
        print("Continue button Tapped")
        guard let email = emailField.text, !email.isEmpty,
              let password = passwordFiled.text, !password.isEmpty else {
            print("Missing field data")
            return
        }
        
        //get auth instacne
        //attempt sign in
        //if failure,present alert to create account
        //if user continues, create account
        
        //check sign in on app launch
        //allow user to sign out with button
        
        FirebaseAuth.Auth.auth().signIn(withEmail: email, password: password, completion: {[weak self] result,error in
            guard let strongSelf = self else {
                return
            }
            
            guard error == nil else {
                //show account creation
                strongSelf.showCreateAccount(email: email, password: password)
                return
            }
            
            print("you have signed in")
            strongSelf.label.isHidden = true
            strongSelf.emailField.isHidden = true
            strongSelf.passwordFiled.isHidden = true
            strongSelf.button.isHidden = true
            
            strongSelf.emailField.resignFirstResponder()
            strongSelf.passwordFiled.resignFirstResponder()
            
        })
    }
    
    func showCreateAccount(email:String , password:String) {
        let alert = UIAlertController(title: "Creat Acccount", message: "Would you like to create an accout", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: {
           _ in
            
            FirebaseAuth.Auth.auth().createUser(withEmail: email, password: password, completion: {[weak self] result,error in
                guard let strongSelf = self else {
                    return
                }
                
                guard error == nil else {
                    //show account creation
                    print("Account Creation Failled")
                    return
                }
                
                print("you have signed in")
                strongSelf.label.isHidden = true
                strongSelf.emailField.isHidden = true
                strongSelf.passwordFiled.isHidden = true
                strongSelf.button.isHidden = true
                
                strongSelf.emailField.resignFirstResponder()
                strongSelf.passwordFiled.resignFirstResponder()
            })
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: {
           _ in
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        emailField.becomeFirstResponder()
        if FirebaseAuth.Auth.auth().currentUser == nil {
            emailField.becomeFirstResponder()
        }
    }
}

