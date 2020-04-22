//
//  StackViewController.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/19/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class LoginStackViewController: StackViewController {

     let label = UILabel()
     let usernameTextField = UITextField()
     let passwordTextField = UITextField()
     let subStackView = UIStackView(arrangedSubviews: [])
     let button = UIButton()

     override func viewDidLoad() {
         super.viewDidLoad()
         view.backgroundColor = UIColor(named: "BackgroundColor")
        mainStackView = UIStackView(arrangedSubviews: [label, subStackView, button])

        view.addSubview(mainStackView)

         setMainStackView()
     }

    override func setMainStackView() {
        super.setMainStackView()
        setLabel()
        setSubStackView()
        setButton()
    }


     //MARK: - Label
     func setLabel() {
         label.text = "Login to your account"
         label.font = UIFont.systemFont(ofSize: 25)
     }


     //MARK: - SubStackView
     func setSubStackView() {
         usernameTextField.textColor = UIColor(named: "TextFieldColor")
         usernameTextField.borderStyle = .roundedRect
         usernameTextField.placeholder = "Username"
         usernameTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true

         passwordTextField.textColor = UIColor(named: "TextFieldColor")
         passwordTextField.borderStyle = .roundedRect
         passwordTextField.placeholder = "Password"
         passwordTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true

         subStackView.addArrangedSubview(usernameTextField)
         subStackView.addArrangedSubview(passwordTextField)
         subStackView.widthAnchor.constraint(equalToConstant: 335).isActive = true
         subStackView.axis = .vertical
         subStackView.alignment = .fill
         subStackView.distribution = .fill
         subStackView.spacing = 20
     }


     //MARK: - Button
     func setButton() {
         button.widthAnchor.constraint(equalToConstant: 200).isActive = true
         button.layer.cornerRadius = 20
         button.backgroundColor = .yellow
         button.setTitle("LOG IN", for: .normal)
         button.setTitleColor(.black, for: .normal)
         button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
         button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
     }

     //MARK: - кнопка перехода к след экрану
    @objc func buttonTapped(sender: UIButton) {
         let username = usernameTextField.text ?? ""
         let password = passwordTextField.text ?? ""

         //выполнение записи данных пользователя
         let decodedUserInfo = FileStorageManager.fetchInfoFromFileStorage()
         print(decodedUserInfo["username"] ?? "")
         let decodedUsername = decodedUserInfo["username"] ?? ""
         let decodedPassword = decodedUserInfo["password"] ?? ""

         if username == decodedUsername && password == decodedPassword {
             //запись данных в userDefaults
             MyUserDefaults.saveSignedValue()
             print("Signed value saved to UserDefaults")
             performSegue(withIdentifier: "FromStackVCToWelcomeVC", sender: nil)
     }
     }

}

