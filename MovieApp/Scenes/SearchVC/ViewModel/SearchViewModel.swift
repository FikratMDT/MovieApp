//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by Fikrat on 24.10.22.
//

import Foundation

class SearchViewModel {
    
    var item = [MovieResult]()
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func searchMovies (text: String) {
        SearchManager.shared.searchMovies(text: text) { items, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let docs = items {
                self.item = docs.results
                self.successCallback?()
            }
        }
    }
}
