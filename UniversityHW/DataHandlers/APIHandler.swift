//
//  APIHandler.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/12/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

class APIHandler {
    
     func requestDataToAPI(urlString: String, completion: @escaping (Data) -> Void) {
        let session = URLSession.shared
        guard let url = URL(string: urlString) else {return}
        let task = session.dataTask(with: url) {(data, response, error) in
            if let error = error {
                print(error)
            }
            guard let data = data else {return}
            print(data)
            completion(data)
        }
        task.resume()
    }

}



