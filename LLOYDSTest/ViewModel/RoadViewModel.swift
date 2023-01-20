//
//  RoadViewModel.swift
//  LLOYDSTest
//
//  Created by tzh on 19/01/2023.
//

import Foundation
import RxSwift

class BaseViewModel: NSObject {
    var apiManager : APIManager = APIManager()
}
class RoadViewModel:  BaseViewModel {
  
    var roadObj: Road?
  
    func getRoad(roadId: String?) -> Completable {
        guard let roadId = roadId else {
            return Completable.empty()
        }
        return self.apiManager.getRoad(endpointURL: .getRoad(roadId) )
            .flatMapCompletable { [weak self] (road) -> Completable in
                self?.roadObj = road
                return Completable.empty()
        }
    }


}
