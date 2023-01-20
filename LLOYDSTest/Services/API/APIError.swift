//
//  APIError.swift
//  LLOYDSTest
//
//  Created by tzh on 19/01/2023.
//

import Foundation
enum CommonErrors:String{
    case networkFailure
}

class APIError: NSObject {

    func message(_ message:String) -> NSError {
        return NSError(domain: "Unspecific", code: 0, userInfo: ["message":message])
    }
    
    func type(_ type:CommonErrors) -> NSError {
        return NSError(domain: "Unspecific", code: 0, userInfo: ["message":type.rawValue])
    }
}
