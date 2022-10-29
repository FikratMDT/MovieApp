//
//  ViewModel.swift
//  MovieApp
//
//  Created by Fikrat on 20.08.22.
//

import UIKit
import Alamofire

class MovieViewModel {
    
    var movies = [Result]()
    var moviesTest: Result?
    var movie: MovieList?
    var category = "popular"
    var categories: String?
    
    var successCallback: (()->())?
        
    func getMovies() {
        MovieManager.shared.getPopular(category: category, page: (movie?.page ?? 0) + 1)  { [weak self] items in
            print(items)
            self?.movie = items
            //            self?.movies = items.results
            self?.movies.append(contentsOf: items.results)
            self?.successCallback?()
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
        MovieManager.shared.getPopular(category: "now_playing", page: 1) { [weak self] items in
//            self?.movie = items
            
            self?.successCallback?()
        }
    }
    
    //    func getPhotos(complete: @escaping(() -> ())){
    //        MovieManager.shared.getPopular { items in
    //            self.movies = items.results
    //            complete()
    //        }
    //    }
}
