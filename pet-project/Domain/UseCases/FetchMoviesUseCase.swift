//
//  FetchMoviesUseCase.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 01/10/2026.
//

import Foundation

struct FetchMoviesUseCase {
    
    private let moviesRepository: MoviesRepository

    init(moviesRepository: MoviesRepository) {
        self.moviesRepository = moviesRepository
    }
    
    func callAsFunction() async -> Result<MoviesResult, Error> {
        return await moviesRepository.fetchMovies()
    }
}
