//
//  TestStruct.swift
//  Where2Meet
//
//  Created by Angelo Domingo on 2/1/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import Foundation

struct User: Codable {
    var name:String = ""
    
    init(name: String){
        self.name = name
    }
}


struct Location: Codable {
    var deviceId : String
    var code : String
    var location : String
    
    init(deviceId: String, code: String, location: String){
        self.deviceId = deviceId
        self.code = code
        self.location = location
    }
}
