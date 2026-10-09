//
//  MovieDto.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 01/10/2026.
//

internal struct MovieDto: Codable {
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
    let releaseDate: String
    let isSoftCore: Bool?
    let isInVideo: Bool?
    let voteAverage: Float
    let voteCount: Int
}

internal struct MoviesResultDto: Codable {
    let page: Int
    let results: [MovieDto]
    let totalPages: Int
    let totalResults: Int
}
