//
//  FileStorageManager.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/14/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

class  FileStorageManager: Storage {
    func save(array: [Student]) {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        guard let fileURL = urls.first?.appendingPathComponent("students.txt") else {return}
        do {
            let userInfoData = try JSONEncoder().encode(array)
            try userInfoData.write(to: fileURL)
            print("success FileStorage")
            print ("\(fileURL)")
        } catch {
            print(error)
        }
    }
}
