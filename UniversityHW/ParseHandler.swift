//
//  ParseHandler.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/12/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

class ParseHandler {

    //arrayOfStudents будет содержать полученные данные
    var arrayOfStudents: [Student] = []

//    func parse(data: Data, completion: @escaping () -> Void) -> [Student] {
//        do {
//        let json = try JSONDecoder().decode(SWPeople.self, from: data)
//        json.people.forEach { (person) in
//        self.arrayOfStudents.append(Student(name: person.name))
//        }
//        //запуск completion (замыкания, которое обновляет collectionView) обязательновыполним на основном потоке
//        DispatchQueue.main.async {
//        completion()
//        }
//    } catch let jsonError {
//        print(jsonError)
//    }
//        return arrayOfStudents
//    }
}