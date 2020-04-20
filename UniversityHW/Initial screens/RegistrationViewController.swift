//
//  RegistrationViewController.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/9/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var registerButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        registerButton.layer.cornerRadius = 20
        //self.usernameTextField.becomeFirstResponder()
    }
    
    @IBAction func buttonPressed(_ sender: Any) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        //выполнение записи данных пользователя
        let userInfo: [String: String] = ["username" : username, "password": password]
        
        //условия для выполнения записи данных пользователя и перехода к другому экрану (при нажатии на кнопку)
        let validator = Validator()
        if validator.isLoginCorrect(login: username) == true &&
            validator.isLoginContainsCorrectSymbols(login: username) == true &&
            validator.isPasswordCorrect(password: password) == true {
            //сохранение данных пользователя
        FileStorageManager.userInfoInFileStorage(userInfo: userInfo)
            //performSegue(withIdentifier: "RegistrVCToLoginVC", sender: nil)
            performSegue(withIdentifier: "ToStackVC", sender: nil)
        } else {
            validator.alertSending(self)
        }
    }
}
