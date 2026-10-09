//
//  FetchMoviesRepository.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 01/10/2026.
//

import Foundation

internal struct DefaultMoviesRepository : MoviesRepository {
    
    private let moviesDataSource: MoviesDataSource
    private let accessToken: String

    init(moviesDataSource: MoviesDataSource, accessToken: String) {
        self.moviesDataSource = moviesDataSource
        self.accessToken = accessToken
    }
    
    func fetchMovies() async -> Result<MoviesResult, Error> {
        return await moviesDataSource.fetchMoviesData(apiKey: accessToken)
            .map { dto in dto.toDomain() }
    }
}
