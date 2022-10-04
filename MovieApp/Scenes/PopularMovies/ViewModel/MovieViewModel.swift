//
//  ViewModel.swift
//  MovieApp
//
//  Created by Fikrat on 20.08.22.
//

import UIKit
import Alamofire

class MovieViewModel{
    
    var movies = [Result]()

    
    func getMovies(complete: @escaping(() -> ())){
        MovieManager.shared.getPopular { [weak self] items in
            print(items)
            self?.movies = items.results
            complete()
        }
    }
    
    func getPhotos(complete: @escaping(() -> ())){
        MovieManager.shared.getPopular { items in
            self.movies = items.results
            complete()
        }
    }
    
}
