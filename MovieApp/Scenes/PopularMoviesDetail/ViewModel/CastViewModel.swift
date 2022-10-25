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
    
    func getCast(id: Int, complete: @escaping(([Cast]) ->())) {
        CastManager.shared.getCasts(id: id) { items in
            self.castList = items
            complete(items.cast)
        }
    }
}

