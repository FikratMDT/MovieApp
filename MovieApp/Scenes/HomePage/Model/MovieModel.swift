//
//  MovieModel.swift
//  MovieApp
//
//  Created by Fikrat on 13.08.22.
//

import Foundation

// MARK: - Welcome
struct MovieList: Codable {
    let page: Int
    let results: [MovieResult]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - MovieResult
struct MovieResult: Codable, HorizontalMovieCellProtocol, HorizontalMovieGenresCellProcotol {
    
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount: Int
   
    var genreLabelText: [Int] {
        genreIDS
    }
    
    var genreList: [Int] {
        genreIDS
    }
    
    var movieTitleText: String {
        originalTitle
    }
    
    var movieImageView: String {
        "https://image.tmdb.org/t/p/original/" + posterPath
    }
    
    var releaseDateTitleText: String {
        releaseDate
    }
    
    var voteAvarageLabelText: Double {
        voteAverage
    }
    var movieId: Int {
        id
    }
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage: String, Codable {
    case en = "en"
}

