//
//  UserDefaults.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/18/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

class MyUserDefaults {

    static func saveSignedValue() {
        let userDefaults = UserDefaults.standard
        //класть словари,массивы
        userDefaults.set("true", forKey: "signed")
    }
    
    static func saveInterfaceStyleValue(number: Int) { UserDefaults.standard.set(number, forKey: "style")
        print("Interface Style saved to UserDefaults")
    }
}
