//
//  MovieDetailManager.swift
//  MovieApp
//
//  Created by Fikrat on 27.08.22.
//

import Foundation
import UIKit

class MovieDetailManager{
    
    static let shared = MovieDetailManager()
    
    
    func getMovie(id: Int,complete: @escaping((MovieDetailList) -> ()) ){
//        let url =  "https://api.themoviedb.org/3/movie/\(id)?api_key=e2253416fac0cd2476291eb33c92beb7&language=en-US"
        NetworkManager.shared.request(type: MovieDetailList.self,
                                      url:NetworkHelper.shared.urlConfiguration("3/movie/\(id)?api_key=e2253416fac0cd2476291eb33c92beb7&language=en-US"),
                                      method: .get) { response in
            complete(response)
        }
    }
//
//    func getMoviesDetail(id: Int, complete: @escaping((MovieList) -> ()) ){
//        let url =  "https://api.themoviedb.org/3/movie/\(id)?api_key=e2253416fac0cd2476291eb33c92beb7&language=en-US"
//        NetworkManager.shared.request(type: MovieList.self,
//                                      url:NetworkHelper.shared.urlConfiguration("3/movie/\(id)?api_key=e2253416fac0cd2476291eb33c92beb7&language=en-US"),
//                                      method: .get) { response in
//            complete(response)
//        }
//
//    }
    
}

