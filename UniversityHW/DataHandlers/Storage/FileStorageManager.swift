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

    //MARK: - File Storage (запись данных пользователя)
    static func userInfoInFileStorage(userInfo: [String: String]) {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        guard let fileURL = urls.first?.appendingPathComponent("users.txt") else {return}
        do {
            let userInfoData = try JSONEncoder().encode(userInfo)
            try userInfoData.write(to: fileURL)
            print("success")
            print ("\(fileURL)")
        } catch {
            print(error)
        }
    }

    //MARK: - File Storage (достаем данные пользователя)
    static func fetchInfoFromFileStorage() -> [String: String] {
        var decodedUserInfo: [String : String] = [:]
        let urls = FileManager.default.urls(for: .documentDirectory, in: .allDomainsMask)
        if let fileURL = urls.first?.appendingPathComponent("users.txt") {
            do {
                let dataFromFile = try Data(contentsOf: fileURL)
                let decoder = JSONDecoder()
                decodedUserInfo = try decoder.decode([String: String].self, from: dataFromFile)
                print(decodedUserInfo)
            } catch {
            }
        }
        return decodedUserInfo
    }
}
