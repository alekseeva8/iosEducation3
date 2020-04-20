//
//  SecondViewController.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/9/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var studentsListButton: UIButton!
    @IBOutlet weak var settingsButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor(named: "BackgroundColor")
        studentsListButton.layer.cornerRadius = 10
        settingsButton.layer.cornerRadius = 10

        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Settings", style: .plain, target: self, action: #selector(goToSettingsVC))
    }

    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "fromWelcomeVCToCollectionVC", sender: nil)
    }

    @objc func goToSettingsVC() {
        performSegue(withIdentifier: "toSettingsVC", sender: nil)
    }

}
