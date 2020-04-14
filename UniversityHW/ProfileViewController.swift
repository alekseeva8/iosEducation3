//
//  ProfileViewController.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/13/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    @IBOutlet weak var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile"

        nameLabel.text = ProfileManager.shared.name

    }

}
