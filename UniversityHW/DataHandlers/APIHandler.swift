//
//  APIHandler.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/12/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

class APIHandler {
    //singleton
//    static let shared = APIHandler()
//    private init() {
//       }

    //arrayOfStudents будет содержать полученные данные
    var arrayOfStudents: [Student] = []

    func getData(completion: @escaping ([Student]) -> Void) {
            let session = URLSession.shared
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        let task = session.dataTask(with: url) {(data, response, error) in
            if let error = error {
            print(error)
            }
            guard let data = data else {return}
            print(data)
            do {
                let json = try JSONDecoder().decode([StudentAPI].self, from: data)
                json.forEach { (one) in
                    self.arrayOfStudents.append(Student(name: one.name))
                }
                //запуск completion (замыкания, которое будет обновлять collectionView) обязательно выполним на основном потоке
                            DispatchQueue.main.async {
                                completion(self.arrayOfStudents)
                            }
                        } catch let jsonError {
                            print(jsonError)
                        }
                    }
                task.resume()
    }

//   КАК  вернуть данные типа Data !!!
//    func requestDataToAPI(completion: @escaping () -> Void) -> Data {
//        let session = URLSession.shared
//        var dataReceived = Data()
//        let url = URL(string: "https://jsonplaceholder.typicode.com/users")! //else {
//            //return dataReceived
//       // }
//        let task = session.dataTask(with: url) {(data, response, error) in
//                if let error = error {
//                    print(error)
//                }
//                guard let dataReceived = data else {return}
//    }
//        task.resume()
//        DispatchQueue.main.async {
//        completion()
//        }
//        return dataReceived
//    }

}
