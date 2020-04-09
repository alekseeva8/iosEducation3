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
        //условия для выполнения записи данных пользователя и перехода к другому экрану (при нажатии на кнопку)

        let username = usernameTextField.text ?? ""
        let password = passwordTextField.text ?? ""

        let validator = Validator()
        if validator.isLoginCorrect(login: username) == true &&
            validator.isLoginContainsCorrectSymbols(login: username) == true &&
            validator.isPasswordCorrect(password: password) == true {
            //выполнение записи данных пользователя
            let userInfo: [String] = [username, password]
            userInfoInFileStorage(userInfo: userInfo)
            //performSegue(withIdentifier: "fromFirstVCToSecondVC", sender: nil)
//            let secondVC = SecondViewController()
//            navigationController?.pushViewController(secondVC, animated: true)
        } else {
            validator.alertSending(self)
        }
    }

    //MARK: - File Storage пример (с типом String)
    func userInfoInFileStorage(userInfo: [String]) {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        guard let fileURL = urls.first?.appendingPathComponent("users.txt") else {return}
        do {
            let userInfoData = try JSONEncoder().encode(userInfo)
                try userInfoData.write(to: fileURL)
            print("success")
            userDefaults()
            print ("\(fileURL)")
        } catch {
            print(error)
        }

//        do {
//            let dataFromFile = try Data(contentsOf: fileURL)
//            let decodedUserInfo = try JSONDecoder.decode(Array<String>.self, from: dataFromFile)
//            print("Content is \(decodedUserInfo)")
//        } catch {
//
//        }
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

struct UserInfo: Codable {
    var username: String
    var password: String
}

//enum TrueOrFalse {
//    case yes, no
//}
