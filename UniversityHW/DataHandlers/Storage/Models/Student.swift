//
//  Student.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/12/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

struct Student: Codable {
    var name: String

    init(name: String) {
        self.name = name
    }
}
