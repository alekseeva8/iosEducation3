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
        setLabel(label: label, text: "Login to your account")
        setSubStackView(arrayOftextFieldPlaceholders: ["Username", "Password"])
        setButton(button: button, title: "LOG IN")
    }

     //MARK: - Button
    override func setButton(button: UIButton, title: String) {
        super.setButton(button: button, title: title)
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }

     //MARK: - кнопка перехода к след экрану
    @objc func buttonPressed(sender: UIButton) {
        performSegue(withIdentifier: "FromStackVCToWelcomeVC", sender: nil)

//         let username = usernameTextField.text ?? ""
//         let password = passwordTextField.text ?? ""
//
//         //выполнение записи данных пользователя
//         let decodedUserInfo = FileStorageManager.fetchInfoFromFileStorage()
//         print(decodedUserInfo["username"] ?? "")
//         let decodedUsername = decodedUserInfo["username"] ?? ""
//         let decodedPassword = decodedUserInfo["password"] ?? ""
//
//         if username == decodedUsername && password == decodedPassword {
//             //запись данных в userDefaults
//             MyUserDefaults.saveSignedValue()
//             print("Signed value saved to UserDefaults")
//             performSegue(withIdentifier: "FromStackVCToWelcomeVC", sender: nil)
//     }
     }

}

