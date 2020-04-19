//
//  ViewController.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/8/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")
        loginButton.layer.cornerRadius = 20
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        //выполнение записи данных пользователя
        let decodedUserInfo = FileStorageManager.fetchInfoFromFileStorage()
        print(decodedUserInfo["username"] ?? "")
        let decodedUsername = decodedUserInfo["username"] ?? ""
        let decodedPassword = decodedUserInfo["password"] ?? ""

        if username == decodedUsername && password == decodedPassword {
            //запись данных в userDefaults
            MyUserDefaults.userDefaults()
            print("userDefaults saved")
            //performSegue(withIdentifier: "fromLoginVCToWelcomeVC", sender: nil)
            performSegue(withIdentifier: "FromStackVCToWelcomeVC", sender: nil)
        }
    }
}
