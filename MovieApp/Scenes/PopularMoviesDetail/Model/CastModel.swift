//
//  CastModel.swift
//  MovieApp
//
//  Created by Fikrat on 19.10.22.
//

import Foundation

import Foundation

struct CastList: Codable {
    let id: Int
    let cast: [Cast]
//    let crew: [Crew]
}

struct Cast: Codable, CellProtocol {
    let adult: Bool?
    let gender, id: Int?
    let knownForDepartment, name, originalName: String?
//    let popularity: Double?
    let profilePath: String?
    let castID: Int?
    let character, creditID: String?
    let order: Int?
    let department, job: String?
    
    
    enum CodingKeys: String, CodingKey {
        case adult
        case gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
//        case popularity
        case profilePath = "profile_path"
        case castID = "cast_id"
        case character
        case creditID = "credit_id"
        case order
        case department, job
    }
    
    var cellTitle: String {
        name ?? ""
    }
    
    var cellImage: String {
        "https://image.tmdb.org/t/p/original" + (profilePath ?? "")
    }
}

// MARK: - Crew
struct Crew: Codable {
    let adult: Bool
    let gender, id: Int
    let knownForDepartment, name, originalName: String
    let popularity: Double
    let profilePath, creditID, department, job: String

    enum CodingKeys: String, CodingKey {
        case adult, gender, id
        case knownForDepartment = "known_for_department"
        case name
        case originalName = "original_name"
        case popularity
        case profilePath = "profile_path"
        case creditID = "credit_id"
        case department, job
    }
}

