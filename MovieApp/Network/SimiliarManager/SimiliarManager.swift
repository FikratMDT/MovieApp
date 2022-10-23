//
//  SimiliarManager.swift
//  MovieApp
//
//  Created by Fikrat on 22.10.22.
//

import Foundation

class SimiliarManager {
    
    static let shared = SimiliarManager()
    
    func getSimiliar (id: Int,complete: @escaping((SimiliarMovies) -> ()) ) {
        //        let url =  "https://api.themoviedb.org/3/movie/\(id)?api_key=e2253416fac0cd2476291eb33c92beb7&language=en-US"
        
        
        NetworkManager.shared.request(type: SimiliarMovies.self,
                                      url:NetworkHelper.shared.urlConfiguration("3/movie/\(id)/similiar?api_key=e2253416fac0cd2476291eb33c92beb7&language=en-US"),
                                      method: .get) { response in
            complete(response)
        }
    }
}
