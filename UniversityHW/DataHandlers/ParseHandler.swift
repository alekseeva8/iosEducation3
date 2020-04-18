//
//  ParseHandler.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/12/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

class ParseHandler {

    let urlString = "https://jsonplaceholder.typicode.com/users"

    func getData(completionHanndler: @escaping ([StudentAPI]) -> Void) {
        APIHandler().requestDataToAPI(urlString: urlString) { (data) in
            do {
                let json = try JSONDecoder().decode([StudentAPI].self, from: data)
                DispatchQueue.main.async {
                    completionHanndler(json)
                }
            }
            catch let jsonError {
                print(jsonError)
            }
        }
    }
}

//protocol TypeConvertible: Codable {
//    static var urlString: String {get}
//}

//struct StudentsAPI: Codable, TypeConvertible {
//    static let urlString = "https://jsonplaceholder.typicode.com/users"
//    var users: [StudentAPI]
//}

// [[String:String]]
// [[String : Any]]

struct StudentAPI: Codable {
    let name: String
}
