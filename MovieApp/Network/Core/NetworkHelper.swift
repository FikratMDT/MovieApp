//
//  NetworkHelper.swift
//  MovieApp
//
//  Created by Fikrat on 28.08.22.
//

import Foundation
enum ErrorTypes: String, Error {
    case invalidData = "Invalid data"
    case invalidURL = "Invalid url"
    case generalError = "An error happened"
}
class NetworkHelper{
    
    static let shared = NetworkHelper()
    
    var baseUrl = "https://api.themoviedb.org/"
    
    func urlConfiguration(_ url: String) -> String{
        baseUrl+url
    }
}
