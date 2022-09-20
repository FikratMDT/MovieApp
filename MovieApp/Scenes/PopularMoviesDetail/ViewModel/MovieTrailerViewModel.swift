//
//  MovieTrailerViewModel.swift
//  MovieApp
//
//  Created by Fikrat on 19.09.22.
//

import Foundation

class MovieTrailerViewModel {
    
    var id = 0
    var trailerModel: MovieTrailerModel?
    
    
    func getMovieTrailer (complete: @escaping(() ->())) {
        MovieTrailerManager.shared.getMovieTrailer(id: id) { movies in
            self.trailerModel = movies
            complete()
        }
    }
}
