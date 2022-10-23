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
    var id = 0
    
    func getCast (complete: @escaping(() ->())) {
        CastManager.shared.getCasts(id: id) { items in
            self.castList = items
            complete()
        }
    }
}

