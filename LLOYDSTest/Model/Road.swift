//
//  Road.swift
//  LLOYDSTest
//
//  Created by tzh on 19/01/2023.
//

import Foundation
import ObjectMapper
import RxDataSources

struct Road : Mappable, Codable{
    
    var id: String?
    var displayName: String?
    var statusSeverity: String?
    var statusSeverityDescription: String?
    var bounds: String?
    var envelope: String?
    var url: String?
    
    init?(map: Map) {
        
    }
    
    mutating func mapping(map: Map) {
        id           <-  map["id"]
        displayName          <-  map["displayName"]
        statusSeverity         <-  map["statusSeverity"]
        statusSeverityDescription           <-  map["statusSeverityDescription"]
        bounds     <-  map["bounds"]
        envelope   <- map["envelope"]
        url     <- map["url"]
        
    }
}
