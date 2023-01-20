//
//  APIManager.swift
//  LLOYDSTest
//
//  Created by tzh on 19/01/2023.
//

import Foundation
import Alamofire
import ObjectMapper
import RxSwift

typealias APIManagerClosure<K> = (K?)->Void

class APIManager: NSObject {
    
    static let API_KEY_V3 = "f1c9847e4213468ebbcc51c1357cc9e2"
    
    func getRoad(endpointURL: APIEndpoints) -> Single<Road> {
      
        return Single<Road>.create(subscribe: { (observer) -> Disposable in

            AF.request(endpointURL.url(), method: .get, parameters: nil,  headers: nil)
            .validate(statusCode: 200..<300)
            .responseDecodable(of: [Road].self){response in
                if let models = response.value, let model = models.first  {
                    observer(.success(model))
                }
                else {
                    if let error = response.error {
                        
                        observer(.error(error))
                        return
                    }
                }
            }
            
            
            return Disposables.create {
                return
            }
        })
       
    }
    
}
