//
//  StackViewController.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/19/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    let mainStackView = UIStackView(arrangedSubviews: [])
    let label = UILabel()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let subStackView = UIStackView(arrangedSubviews: [])
    let button = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")

        view.addSubview(mainStackView)

        setLabel()
        setSubStackView()
        setButton()
        setMainStackView()

        mainStackView.addArrangedSubview(label)
        mainStackView.addArrangedSubview(subStackView)
        mainStackView.addArrangedSubview(button)
    }


    //MARK: - MainStackView
    func setMainStackView() {
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .equalCentering
        mainStackView.spacing = 30

        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        let insets = UIEdgeInsets(top: 50, left: 0, bottom: 90, right: 0)
        //the stack view pins its content to the relevant margin instead of its edge.
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = insets

        subStackView.leadingAnchor.constraint(equalTo: mainStackView.leadingAnchor, constant:  20).isActive = true
        subStackView.trailingAnchor.constraint(equalTo: mainStackView.trailingAnchor, constant:  -20).isActive = true
    }


    //MARK: - Label
    func setLabel() {
        label.text = "Log in to your Account"
        label.font = UIFont.systemFont(ofSize: 25)
    }


    //MARK: - SubStackView
    func setSubStackView() {
        usernameTextField.textColor = .black
        usernameTextField.borderStyle = .roundedRect
        usernameTextField.placeholder = "Username"

        passwordTextField.textColor = .black
        passwordTextField.borderStyle = .roundedRect
        passwordTextField.placeholder = "Password"

        subStackView.addArrangedSubview(usernameTextField)
        subStackView.addArrangedSubview(passwordTextField)
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
            MyUserDefaults.userDefaults()
            print("userDefaults saved")
            //performSegue(withIdentifier: "fromLoginVCToWelcomeVC", sender: nil)
            performSegue(withIdentifier: "FromStackVCToWelcomeVC", sender: nil)
    }
    }
}
