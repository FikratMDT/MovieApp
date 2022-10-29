//
//  ViewModel.swift
//  MovieApp
//
//  Created by Fikrat on 20.08.22.
//

import UIKit
import Alamofire

class MovieViewModel {
    
    var movies = [MovieResult]()
    var movie: MovieList?
    var category = "top_rated"
    var categories: String?
    var page = 1
    
    var successCallback: (()->())?
    var errorCallback: ((String)->())?
        
    func getMovies() {
        MovieManager.shared.getPopular(category: category, page: (movie?.page ?? 0) + 1)  { [weak self] items, errorMessage in
            if let errorMessage = errorMessage {
                self?.errorCallback?(errorMessage)
            } else if let movie = items {
                
                self?.movie = items
                self?.movies.append(contentsOf: movie.results)
                self?.successCallback?()
            }
//            print(items)
//            self?.movie = items
//            //self?.movies = items.results
//            self?.movies.append(contentsOf: items.results)
//            self?.successCallback?()
        }
    }
    
    func pagination (index: Int) {
        if let item = movie {
            if (item.page <= item.totalPages) && index == (movies.count - 1) {
                getMovies()
            }
        }
    }
    
    func getNowPlaying() {
        MovieManager.shared.getPopular(category: "popular", page: page) { [weak self] items,errorMessage  in
            if let errorMessage = errorMessage {
                self?.errorCallback?(errorMessage)
            } else if let movie = items {
                self?.movies = movie.results 
                self?.successCallback?()
            }
        }
    }
    
    //    func getPhotos(complete: @escaping(() -> ())){
    //        MovieManager.shared.getPopular { items in
    //            self.movies = items.results
    //            complete()
    //        }
    //    }
}
