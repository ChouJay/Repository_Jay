//
//  ViewController.swift
//  HW Week 3
//
//  Created by Jay Chou on 2022/4/8.
//

import UIKit




class ViewController: UIViewController {
    @IBAction func segmentSwitch2(_ sender: CustomSegmentControl) {
        if sender.selectedSegmentIndex == 0 {
            print("log in mode")
            logInUserInterface()
        } else {
            print("sign up mode")
            checkLabel.textColor = .black
            checkField.backgroundColor = .white
            checkField.isUserInteractionEnabled = true
            
        }
    }
//      使用預設的segmentControl似乎無法達到作業需求的UI
//    @IBAction func segmentSwitch(_ sender: UISegmentedControl) {
//        if sender.selectedSegmentIndex == 0 {
//            print("log in mode")
//            logInUserInterface()
//        } else {
//            print("sign up mode")
//            checkLabel.textColor = .black
//            checkField.backgroundColor = .white
//            checkField.isUserInteractionEnabled = true
//
//        }
//    }
    let logInEntry = LogInEntry()

   
    @IBAction func changeMode2(_ sender: CustomSegmentControl) {
        if let genreNow = TextFields.Genre(rawValue: sender.selectedSegmentIndex) {
            logInEntry.genre = genreNow
        } else {
            logInEntry.genre = .logIn
        }
        print(logInEntry.genre)
    }
    
    
    
    
//    @IBAction func changeMode(_ sender: UISegmentedControl) {
//        if let genreNow = TextFields.Genre(rawValue: sender.selectedSegmentIndex) {
//            logInEntry.genre = genreNow
//        } else {
//            logInEntry.genre = .logIn
//        }
//        print(logInEntry.genre)
//    }
    
    @IBAction func logIn(_ sender: Any) {
        updateTextField()
        switch logInEntry.genre {
        case .logIn:
        if logInEntry.acount == "appworks_school@gmail.com" && logInEntry.password == "1234" {
            
        } else {
            alertPresent(message: "Login fail")
        }
        case .signUp:
            guard logInEntry.acount != "" else {
                alertPresent(message: "Account should not be empty")
                return
            }
            guard logInEntry.password != "" else {
                alertPresent(message: "Password should not be empty")
                return
            }
            guard logInEntry.check != "" else {
                alertPresent(message: "Check Password should not be empty")
                return
            }
            guard logInEntry.check == logInEntry.password else {
                alertPresent(message: "Signup fail")
                return
            }
         print("sign up mode flow")
        }
    }
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    
    
    @IBOutlet weak var accountField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet weak var checkField: UITextField!
    
    @IBOutlet weak var checkLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        logInUserInterface()
       
        
        
        
    }


    func updateTextField() {
        logInEntry.acount = accountField.text ?? ""
        logInEntry.password = passwordField.text ?? ""
        logInEntry.check = checkField.text ?? ""
    }
    
    func logInUserInterface() {
        checkLabel.textColor = .gray
        checkField.backgroundColor = .darkGray
        checkField.isUserInteractionEnabled = false
        checkField.text = ""
    }
    func alertPresent(message: String) {
        let alert = UIAlertController(title: "Error", message: "\(message)", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: { action in
        })
        alert.addAction(action)
        present(alert, animated: true)
    }
}

