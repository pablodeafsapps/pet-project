//
//  Movie.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 01/10/2026.
//

import Foundation

struct Movie: Identifiable {
    let isForAdults: Bool?
    let backdropPath: String
    let genreIds: [Int]
    let id: Int
    let title: String
    let originalLanguage: String
    let originalTitle: String
    let overview: String
    let popularity: Float
    let posterPath: String
    let releaseDate: Date?
    let isSoftCore: Bool?
    let isInVideo: Bool?
    let voteAverage: Float
    let voteCount: Int
}

struct MoviesResult {
    let page: Int
    let movies: [Movie]
    let totalPages: Int
    let totalResults: Int
}
