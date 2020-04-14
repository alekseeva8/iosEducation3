//
//  DatabaseManager.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/14/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation
import  CoreData
import UIKit

class DatabaseManager: Storage {
    var students: [StudentCD] = []

    func save(array: [Student]) {

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
     //managedContext- копия данных хранилища
     let managedContext = appDelegate.persistentContainer.viewContext
     array.forEach { (one) in
         let student = StudentCD(context: managedContext)
         student.name = one.name
     }
     do {
         try managedContext.save()
         print("success CoreData")
     } catch  {
         fatalError()
     }

    }

    func fetchCoreData() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<StudentCD>(entityName: "StudentCD")

        do {
            students = try managedContext.fetch(fetchRequest)

            let newEmployees = students.map { (item) -> String? in
                return item.name
            }
            print(newEmployees)
            students.forEach { (e) in
                managedContext.delete(e)
            }

            try managedContext.save()
        } catch  {
            fatalError()
        }
    }


}
