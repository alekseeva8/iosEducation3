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
    //let storageHandler = StorageHandler(storage: Storage)

    func handle(completion: @escaping ([Student]) -> Void) {
        apiHandler.getData(completion: completion)

        //let dataRecieved = apiHandler.requestDataToAPI()
        //let arrayOfStudents = parseHandler.parse(data: dataRecieved)
        //storageHandler.saveToStorage(array: arrayOfStudents)
    }


}
