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
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            userInfoInFileStorage(userInfo: userInfo)
            performSegue(withIdentifier: "RegistrVCToLoginVC", sender: nil)
        } else {
            validator.alertSending(self)
        }
    }
    
    //MARK: - File Storage (запись данных)
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
        
    }
}
