//
//  DataHandler.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/12/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation
import  UIKit

class  DataHandler {

    static let shared = DataHandler()
    private init() {
    }

    let apiHandler = APIHandler()
    //let parseHandler = ParseHandler()
    //let storageHandler = StorageHandler(storage: StorageType)

    let urlString = "https://jsonplaceholder.typicode.com/users"

    func handle(completion: @escaping ([Student]) -> Void) {
        apiHandler.getData(urlString: urlString, completion: completion)

        //let dataRecieved = apiHandler.requestDataToAPI()
        //let arrayOfStudents = parseHandler.parse(data: dataRecieved)
        //storageHandler.save(array: arrayOfStudents)
    }
}
