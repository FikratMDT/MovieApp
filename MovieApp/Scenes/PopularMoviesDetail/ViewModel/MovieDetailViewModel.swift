//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Fikrat on 28.08.22.
//

import Foundation

class MovieDetailViewModel {
    var id = 0
    var movieDetail: MovieDetailList?
    
//    init(id: Int) {
//        self.id = id
//    }
    
    func getMovie (complete: @escaping(() ->())) {
        MovieDetailManager.shared.getMovie(id: id) { movies in
            self.movieDetail = movies
            complete()
        }
    }
    
}
