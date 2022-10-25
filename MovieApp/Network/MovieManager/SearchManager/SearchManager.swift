//
//  SearchManager.swift
//  MovieApp
//
//  Created by Fikrat on 18.10.22.
//

import Foundation

class SearchManager {
    static let shared = SearchManager()
    
    func searchMovies (text: String, complete: @escaping((MovieList?, String?) -> ())) {
//        let url = NetworkHelper.shared.baseUrl + "search/movie?api_key=e2253416fac0cd2476291eb33c92beb7&language=en-US&query=\(text)"
//        NetworkManager.shared.request(type: MovieList.self, url: url, method: .get) { response in
//            switch response {
//            case .success(let model):
//                complete(model, nil)
//            }
//            //        case .failure(let error):
//            complete(nil, error.localizedDescription)
        }
}
