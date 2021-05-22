//
//  Movie.swift
//  MyMovies
//
//  Created by David Cormell on 22/05/2021.
//

import Foundation

struct MovieResults: Decodable {
    let results: [Movie]
}

struct Movie: Decodable, Identifiable {
    let id: Int
    let title: String
    let overview: String
    let releaseDate: String
    let voteAverage: Double
    let posterPath: String?
}
