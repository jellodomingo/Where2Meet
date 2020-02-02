//
//  CodeStruct.swift
//  Where2Meet
//
//  Created by Angelo Domingo on 2/1/20.
//  Copyright © 2020 Angelo Domingo. All rights reserved.
//

import Foundation

//generate
struct NewGroupCodeRequest : Encodable {
    var device_id: String
}

//generate response
struct NewGroupCodeResponse : Decodable {
    var code: String?
}

//getprefs
struct ExistingGroupCodeRequest : Encodable {
    var device_id: String
    var code: String
}

//getprefs response
struct PreferencesResponse : Decodable {
    var lat:String?
    var lng:String?
    var radius:String?
    var category:String?
    var price:String?
    var start_time:String?
    var duration:String?
}

//submit request
struct SubmissionRequest : Decodable {
    var device_id:String?
    var code:String?
    
    var lat:String?
    var lng:String?
    var radius:String?
    var category:String?
    var price:String?
    var start_time:String?
    var duration:String?
}


/*
struct SubmissionResponse : Decodable {
    
}
 */


