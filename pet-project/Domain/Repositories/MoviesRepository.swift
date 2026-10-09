//
//  Untitled.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 01/10/2026.
//

protocol MoviesRepository {
    func fetchMovies() async -> Result<MoviesResult, Error>
}
