////
////  SearchManager.swift
////  MovieApp
////
////  Created by Fikrat on 21.09.22.
////
//
//import Foundation
//
//class SearchManager {
//
//    static let shared = SearchManager()
//
//
//    func searchArchive(text: String, complete: @escaping((Archive?, String?)->())) {
//        let url = NetworkHelper.shared.baseURL + "/search/v2/articlesearch.json?q=\(text)&api-key=wQApKyTUq8E5THM9HVdOGem7gohHBZTj"
//
//        NetworkManager.shared.request(type: Archive.self,
//                                      url: url,
//                                      method: .get) { response in
//            switch response {
//            case .success(let model):
//                complete(model, nil)
//            case .failure(let error):
//                complete(nil, error.localizedDescription)
//            }
//        }
//    }
//}
