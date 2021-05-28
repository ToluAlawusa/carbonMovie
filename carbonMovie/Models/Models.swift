//
//  Models.swift
//  carbonMovie
//
//  Created by Tolu Alawusa on 5/28/21.
//

import Foundation


struct FaveMovies: Codable {
    let Title: String
    let Year: String
    let Poster: String
}

struct MovieResults: Codable {
    let Search: [Movies]
}

struct Movies: Codable {
    let Title: String
    let Year: String
    let imdbID: String
    let Poster: String

    private enum CodingKeys: String, CodingKey {
        case Title, Year, imdbID, Poster
    }
}
