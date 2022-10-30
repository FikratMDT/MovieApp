//
//  SimiliarManager.swift
//  MovieApp
//
//  Created by Fikrat on 22.10.22.
//

import Foundation

class SimiliarManager {
    
    static let shared = SimiliarManager()
    
    func getSimiliar (id: Int,complete: @escaping((SimilarMovies?, String?) -> ()) ) {        
        
        NetworkManager.shared.request(type: SimilarMovies.self,
                                      url:NetworkHelper.shared.urlConfiguration("3/movie/\(id)/similar?api_key=e2253416fac0cd2476291eb33c92beb7&language=en-US"),
                                      method: .get) { response in
            switch response {
            case .success(let model):
                complete(model, nil)
            case .failure(let error):
                complete(nil, error.localizedDescription)
            }
        }
    }
}
