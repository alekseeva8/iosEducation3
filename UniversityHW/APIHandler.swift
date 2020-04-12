//
//  APIHandler.swift
//  UniversityHW
//
//  Created by Elena Alekseeva on 4/12/20.
//  Copyright © 2020 Elena Alekseeva. All rights reserved.
//

import Foundation

class APIHandler {

    func requestDataToAPI() -> Data {
        let session = URLSession.shared
        var dataReceived = Data()
        if let url = URL(string: "https://swapi.co/api/people") {
        session.dataTask(with: url) {(data, response, error) in
                if let error = error {
                    print(error)
                }
                guard let data = data else {return}
                dataReceived = data
    }
        }
       // task.resume() - куда??????????
        return dataReceived
    }
}
