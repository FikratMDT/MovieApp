//
//  MovieDetailViewModel.swift
//  MovieApp
//
//  Created by Fikrat on 28.08.22.
//

import Foundation

enum MovieDetailListItemType {
    case cast
    case similarMovies
}

struct MovieDetailListItem {
    let item: Any
    let title: String
    let type: MovieDetailListItemType
}

class MovieDetailViewModel {
    var id = 0
    var movieDetail: MovieDetailList?
    var movieModel = [MovieList]()
    var genreModel = [MovieDetailList]()
    
    var items = [MovieDetailListItem]()
    
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
