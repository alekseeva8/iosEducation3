//
//  StackViewController.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/22/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import UIKit

class StackViewController: UIViewController {

    var mainStackView = UIStackView(arrangedSubviews: [])

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    //MARK: - MainStackView
    func setMainStackView() {

        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.distribution = .equalCentering
        mainStackView.spacing = 30

        mainStackView.translatesAutoresizingMaskIntoConstraints = false
        mainStackView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        mainStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        mainStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true

        let insets = UIEdgeInsets(top: 40, left: 0, bottom: 80, right: 0)
        //the stack view pins its content to the relevant margin instead of its edge.
        mainStackView.isLayoutMarginsRelativeArrangement = true
        mainStackView.layoutMargins = insets
    }

}
