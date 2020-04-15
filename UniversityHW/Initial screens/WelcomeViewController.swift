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

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "WelcomeVC"
        view.backgroundColor = UIColor(named: "BackgroundColor")
        studentsListButton.layer.cornerRadius = 10
    }

    @IBAction func buttonTapped(_ sender: Any) {
        performSegue(withIdentifier: "fromWelcomeVCToCollectionVC", sender: nil)
    }
}
