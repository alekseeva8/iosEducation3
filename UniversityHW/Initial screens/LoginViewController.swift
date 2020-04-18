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
        let decodedUserInfo = fetchInfoFromFileStorage()
        print(decodedUserInfo["username"] ?? "")
        let decodedUsername = decodedUserInfo["username"] ?? ""
        let decodedPassword = decodedUserInfo["password"] ?? ""

        if username == decodedUsername && password == decodedPassword {
            //запись данных в userDefaults
            userDefaults()
            print("userDefaults saved")
            performSegue(withIdentifier: "fromLoginVCToWelcomeVC", sender: nil)
        }
        else {
        }
    }

    //MARK: - File Storage (достаем данные)
    func fetchInfoFromFileStorage() -> [String: String] {
        var decodedUserInfo: [String : String] = [:]
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        if let fileURL = urls.first?.appendingPathComponent("users.txt") {
            do {
                let dataFromFile = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                decodedUserInfo = try decoder.decode([String: String].self, from: dataFromFile)
                print(decodedUserInfo)
            } catch {
            }
        }
        return decodedUserInfo
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
