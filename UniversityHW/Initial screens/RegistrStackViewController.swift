//
//  RegistrStackViewController.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/22/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class RegistrStackViewController: StackViewController {

    let label = UILabel()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let repeatPasswordTextField = UITextField()
    let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        
        mainStackView = UIStackView(arrangedSubviews: [label, subStackView, button])
        view.addSubview(mainStackView)
        //установка MainStackView и установка его элементов (label,subStack, button)
        setMainStackView()
    }
    
    
    //MARK: - MainStackView
        //функция устанавливает не только MainStackView, но сюда же добавлена установка его элементов (label,subStack, button)
    override func setMainStackView() {
        super.setMainStackView()
        setLabel(label: label, text: "Registration")
        
        usernameTextField.placeholder = "Username"
        passwordTextField.placeholder = "Password"
        repeatPasswordTextField.placeholder = "Repeat password"
        let arrayOfTextFields = [usernameTextField, passwordTextField, repeatPasswordTextField]
        setSubStackView(array: arrayOfTextFields)
        
        setButton(button: button, title: "Register")
    }
    
    //MARK: - Button
    override func setButton(button: UIButton, title: String) {
        super.setButton(button: button, title: title)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
    }
    
    @objc func buttonTapped(sender: UIButton) {
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
            performSegue(withIdentifier: "toLoginStackVC", sender: nil)
        } else {
            validator.alertSending(self)
        }
    }

}
