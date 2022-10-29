//
//  MovieManager.swift
//  MovieApp
//
//  Created by Fikrat on 20.08.22.
//

import UIKit

class MovieManager{
    
    static let shared = MovieManager()
    func getPopular(category: String, page: Int, complete: @escaping((MovieList) -> ())){
        
        NetworkManager.shared.request(type: MovieList.self,
                                      url: NetworkHelper.shared.baseUrl + "3/movie/\(category)?api_key=e2253416fac0cd2476291eb33c92beb7&language=en-US&page=\(page)",
                                      method: .get) { response in
            complete(response)
        }
    }
    
    func getPhotos(complete: @escaping((MovieList) -> ())){
        let url = "https://image.tmdb.org/t/p/original"
        
        NetworkManager.shared.request(type: MovieList.self,
                                      url: url,
                                      method: .get) { response in
            complete(response)
        }
    }
    
}
