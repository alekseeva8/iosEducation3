//
//  SettingsViewController.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/20/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var segmentedControll: UISegmentedControl!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "BackgroundColor")

        if let styleIndex = UserDefaults.standard.value(forKey: "style") {
            segmentedControll.selectedSegmentIndex = styleIndex as! Int
        }
    }

    @IBAction func segmentedControlPressed(_ sender: Any) {
        let segmentIndex = segmentedControll.selectedSegmentIndex
        switch segmentIndex {
        case 0:
            self.parent?.overrideUserInterfaceStyle = .unspecified
        case 1:
            self.parent?.overrideUserInterfaceStyle = .light
        case 2:
            self.parent?.overrideUserInterfaceStyle = .dark
        default:
            break
        }
    }

    @IBAction func saveButtonTapped(_ sender: Any) {
        let segmentIndex = segmentedControll.selectedSegmentIndex
        MyUserDefaults.saveInterfaceStyleValue(number: segmentIndex)
    }
}

