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
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getMovie (complete: @escaping(() ->())) {
        MovieDetailManager.shared.getMovie(id: id) { movies, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let movies = movies {
                self.movieDetail = movies
                self.successCallback?()
            }
            complete()
        }
    }
}
