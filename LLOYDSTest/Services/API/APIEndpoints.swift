//
//  APIEndpoints.swift
//  LLOYDSTest
//
//  Created by tzh on 19/01/2023.
//

import Foundation
enum APIEndpoints {
    //            let link = "\(Endpoints.baseUrl)/Road/\(roadId)?app_key=\(Endpoints.apiKey)"

    case getRoad(String)
    
    func url()->String{
        
        switch self {
        case .getRoad(let roadID):
             return signedUrl("/Road/\(roadID)")
       
        }
    }
}

extension APIEndpoints {
    
    
    fileprivate func apiBaseURL()->String{
       
        return "https://api.tfl.gov.uk"
    }
    
    fileprivate func signedUrl(_ path:String)->String{
        
        let urlstring = "\(apiBaseURL())\(path)"
        
        guard let url = URL(string: urlstring) else{
            return urlstring
        }
        
        let signatureParams = ["app_key": APIManager.API_KEY_V3]
        let composedURL = APIManager.compose(url: url, params: signatureParams)
        
        if let finalstring =  composedURL?.absoluteString {
            return finalstring
        }
        
        return urlstring
    }
    
    
}

extension APIManager {
    
    static func compose(url:URL, params:[String:String])->URL?{
        
        var components = URLComponents(url: url, resolvingAgainstBaseURL: false)!
        var queryItems =  Array(components.queryItems ?? [])
        
        params.forEach { param in
             queryItems.append( URLQueryItem(name: param.key, value: param.value))
        }
        components.queryItems = queryItems
        
        return try? components.asURL()
        
    }
}
