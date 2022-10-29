//
//  SimilarViewModel.swift
//  MovieApp
//
//  Created by Fikrat on 22.10.22.
//

import Foundation

class SimilarViewModel {
    
    var similarList: SimilarMovies?
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getSimiliar(id: Int, complete: @escaping(([SimilarResults]?) -> ())) {
        SimiliarManager.shared.getSimiliar(id: id) { items, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let similar = items {
                self.similarList = similar
                self.successCallback?()
                complete(similar.results)
            
            }
//            self.similiarList = items
//            complete(items.results)
        }
    }
}
