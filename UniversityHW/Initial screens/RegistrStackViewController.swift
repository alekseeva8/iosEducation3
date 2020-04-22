//
//  RegistrStackViewController.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/22/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class RegistrStackViewController: UIViewController {

   let mainStackView = UIStackView(arrangedSubviews: [])
    let label = UILabel()
    let usernameTextField = UITextField()
    let passwordTextField = UITextField()
    let repeatPasswordTextField = UITextField()
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
        mainStackView.spacing = 20

        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        let insets = UIEdgeInsets(top: 30, left: 0, bottom: 70, right: 0)
        //the stack view pins its content to the relevant margin instead of its edge.
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = insets
    }


    //MARK: - Label
    func setLabel() {
        label.text = "Registration"
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

        repeatPasswordTextField.textColor = UIColor(named: "TextFieldColor")
        repeatPasswordTextField.borderStyle = .roundedRect
        repeatPasswordTextField.placeholder = "Repeat password"
        repeatPasswordTextField.heightAnchor.constraint(equalToConstant: 34).isActive = true

        subStackView.addArrangedSubview(usernameTextField)
        subStackView.addArrangedSubview(passwordTextField)
        subStackView.addArrangedSubview(repeatPasswordTextField)
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
        button.setTitle("Register", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
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
