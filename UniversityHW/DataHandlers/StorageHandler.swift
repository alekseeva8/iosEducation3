//
//  DataHandler.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/12/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation
import  CoreData
import UIKit

protocol Storage {
    func save(array: [Student])
}

class StorageHandler {
    
    let storage: StorageType
    enum StorageType {
        case fileStorage, coredataStorage
    }
    
    init(storage: StorageType) {
        self.storage = storage
    }
    
    func handle(array: [Student]) {
        switch storage {
        case .fileStorage: FileStorageManager().save(array: array)
        case .coredataStorage: DatabaseManager().save(array: array)
        }
    }
}

//вар2 без enum (работает)
/*
class StorageHandler2 {

    let storage: Storage

    init(storage: Storage) {
        self.storage = storage
    }

    func handle(array: [Student]) {
        storage.save(array: array)
    }
}
 */
