//
//  ViewController.swift
//  Where2Meet
//
//  Created by Angelo Domingo on 2/1/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import UIKit
import Foundation

enum APIError: Error {
    case responseProblem
    case decodingProblem
    case encodingProblem
    case otherProblem
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    
        
        /*
        let testLocation = Location(deviceId: "testDeviceID", code: "testCode", location: "testLocation")
        
        save(testLocation, completion: {result in
            switch result {
            case .success(let message):
                print("It worked?")
            case .failure(let error):
                print("Error: \(error)")
            }
        })
        */
    }
    
    

    func save (_ location:Location, completion: @escaping(Result<Location, APIError>) -> Void)
    {
        let testLocation = location
        
        let testUrl = URL(string: "https://meguzg0s66.execute-api.us-west-1.amazonaws.com/dev/location")!
        
        do {
            var request = URLRequest(url: testUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "POST"
            request.addValue("applications/json", forHTTPHeaderField: "Content-Type")
            request.httpBody = try JSONEncoder().encode(testLocation)
            
            let jsonString = String(data: (request.httpBody as Data?)!, encoding: .utf8)!
            print(jsonString)

            let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
            let task = session.dataTask(with: request) { (data, response, error) in
               // This will run when the network request returns
                guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let jsonData = data else {
                    completion(.failure(.responseProblem))
                    return
                }
                
                do {
                    let messageData = try JSONDecoder().decode(Location.self, from: jsonData)
                    completion(.success(messageData))
                } catch {
                    completion(.failure(.decodingProblem))
                }
                
            
            }
            task.resume()
        } catch {
            completion(.failure(.encodingProblem))
        }
    }

}

