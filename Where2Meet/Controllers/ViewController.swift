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

}

