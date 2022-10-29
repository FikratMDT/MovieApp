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
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
    
    func getMovieTrailer (complete: @escaping(() ->())) {
        MovieTrailerManager.shared.getMovieTrailer(id: id) { movies, errorMessage in
            if let errorMessage = errorMessage {
                self.errorCallback?(errorMessage)
            } else if let trailer = movies {
                self.trailerModel = trailer
                self.successCallback?()
            }
            complete()
//            self.trailerModel = movies
//            complete()
        }
    }
}
