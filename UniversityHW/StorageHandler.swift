//
//  DataHandler.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/12/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

//сохранение данных в разные storage (file or CoreData)
class StorageHandler {
    let storage: Storage
    init(storage: Storage) {
        self.storage = storage
    }
    func saveToStorage(array: [String]) {
        storage.save(array: array)
        //в качестве параметра подавать тип storage
        //switch .. case .file; case .coreData
    }

}

protocol  Storage {
    //change parameters !!!!!!!
    func save(array: [String])
}
