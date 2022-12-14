//
//  MovieTrailerManager.swift
//  MovieApp
//
//  Created by Fikrat on 19.09.22.
//

import Foundation

class MovieTrailerManager {
    
    static let shared = MovieTrailerManager()
    
    func getMovieTrailer(id: Int,complete: @escaping((MovieTrailerModel?, String?) -> ()) ){
        NetworkManager.shared.request(type: MovieTrailerModel.self,
                                      url:NetworkHelper.shared.urlConfiguration("3/movie/\(id)/videos?api_key=e2253416fac0cd2476291eb33c92beb7&language=en-US"),
                                      method: .get) { response in
            switch response {
            case .success(let model):
                complete(model, nil)
                break
            case .failure(let error):
                complete(nil, error.localizedDescription)
                break
            }
        }
    }

}
