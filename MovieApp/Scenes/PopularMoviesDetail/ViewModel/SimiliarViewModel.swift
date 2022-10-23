//
//  SimiliarViewModel.swift
//  MovieApp
//
//  Created by Fikrat on 22.10.22.
//

import Foundation

class SimiliarViewModel {
    
    var similiarList: SimiliarMovies?
    var id = 0
    
    func getSimiliar (complete: @escaping(() -> ())) {
        SimiliarManager.shared.getSimiliar(id: id) { items in
            self.similiarList = items
            complete()
        }
    }
}
