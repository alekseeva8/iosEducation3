//
//  ViewController.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/8/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "FirstVC"
    }

    @IBAction func loginButtonPressed(_ sender: Any) {
        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        //выполнение записи данных пользователя
        let userInfo: [String: String] = ["username" : username, "password": password]
        userInfoInFileStorage(userInfo: userInfo)

        //условия для выполнения записи данных пользователя и перехода к другому экрану (при нажатии на кнопку)
        let validator = Validator()
        if validator.isLoginCorrect(login: username) == true &&
            validator.isLoginContainsCorrectSymbols(login: username) == true &&
            validator.isPasswordCorrect(password: password) == true {
            //запись данных в userDefaults
            userDefaults()
            //performSegue(withIdentifier: "fromFirstVCToSecondVC", sender: nil)
        } else {
            validator.alertSending(self)
        }
    }

    //MARK: - File Storage пример (с типом String)
    func userInfoInFileStorage(userInfo: [String: String]) {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        guard let fileURL = urls.first?.appendingPathComponent("users.txt") else {return}
        do {
            let userInfoData = try JSONEncoder().encode(userInfo)
                try userInfoData.write(to: fileURL)
            print("success")
            print ("\(fileURL)")
        } catch {
            print(error)
        }

        do {
            let dataFromFile = try Data(contentsOf: fileURL)
            let decoder = JSONDecoder()
            let decodedUserInfo = try decoder.decode([String: String].self, from: dataFromFile)
            print(decodedUserInfo)
            print(decodedUserInfo["username"])
        } catch {

        }
    }

    //MARK: - User Defaults
    func userDefaults() {
        let userDefaults = UserDefaults.standard
        //класть словари,массивы
        userDefaults.set("true", forKey: "signed")
        if let value = userDefaults.value(forKey: "signed") {
            print(value)
        }
    }

}
