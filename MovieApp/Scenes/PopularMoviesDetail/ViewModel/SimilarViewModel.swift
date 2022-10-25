//
//  SimilarViewModel.swift
//  MovieApp
//
//  Created by Fikrat on 22.10.22.
//

import Foundation

class SimilarViewModel {
    
    var similiarList: SimilarMovies?
    
    func getSimiliar(id: Int, complete: @escaping(([SimilarResults]?) -> ())) {
        SimiliarManager.shared.getSimiliar(id: id) { items in
            self.similiarList = items
            complete(items.results)
        }
    }
}
