//
//  CastViewModel.swift
//  MovieApp
//
//  Created by Fikrat on 20.10.22.
//

import Foundation
import CloudKit

class CastViewModel {
    
//    var castLists = [Cast]()
    var castList: CastList?
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getCast(id: Int, complete: @escaping(([Cast]) ->())) {
        CastManager.shared.getCasts(id: id) { items,errorMessage  in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let cast = items {
                self.castList = cast
                self.successCallback?()
                complete(cast.cast)
            }
        }
    }
}

