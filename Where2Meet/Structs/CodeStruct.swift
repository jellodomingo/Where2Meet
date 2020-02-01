//
//  CodeStruct.swift
//  Where2Meet
//
//  Created by Angelo Domingo on 2/1/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import Foundation

struct GroupCode : Encodable{
    
    struct Location : Encodable {
        var long:Float
        var lat:Float
    }
    var device_id:String
    var code:String

}

