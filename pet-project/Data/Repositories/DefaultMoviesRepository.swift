//
//  FetchMoviesRepository.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 01/10/2026.
//

import Foundation

internal struct DefaultMoviesRepository : MovieRepository {
    
    private let movieDataSource: MovieDataSource
    private let accessToken: String

    init(movieDataSource: MovieDataSource, accessToken: String) {
        self.movieDataSource = movieDataSource
        self.accessToken = accessToken
    }
    
    func fetchMovies() async -> Result<MoviesResult, Error> {
        return await movieDataSource.fetchMoviesData(apiKey: accessToken)
            .map { dto in dto.toDomain() }
    }
}
