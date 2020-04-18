//
//  UserDefaults.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/18/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

class MyUserDefaults {

    static func userDefaults() {
        let userDefaults = UserDefaults.standard
        //класть словари,массивы
        userDefaults.set("true", forKey: "signed")
        if let value = userDefaults.value(forKey: "signed") {
            print(value)
        }
    }
}
