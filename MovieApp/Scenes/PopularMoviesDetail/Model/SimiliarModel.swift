//
//  SimiliarModel.swift
//  MovieApp
//
//  Created by Fikrat on 22.10.22.
//

import Foundation

struct SimiliarMovies: Codable {
    
    let page: Int?
    let similiarResults: [SimiliarResults]?
    let totalPages, totalResults: Int?
    
    enum CodingKeys: String, CodingKey {
        case page, similiarResults
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct SimiliarResults: Codable, CellProtocol {
    var cellTitle: String {
        originalTitle ?? ""
    }
    
    var cellImage: String {
        "https://image.tmdb.org/t/p/original" + (posterPath ?? "")
    }
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
//    let originalLanguage: OriginalLanguage?
    let originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
//        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

//enum OriginalLanguage: String, Codable {
//    case en = "en"
//}

