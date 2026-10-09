//
//  MovieMapper.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 01/10/2026.
//

import Foundation

private let YYYYMMDD = "yyyy-MM-dd"

internal extension MovieDto {
    func toDomain() -> Movie {
        return Movie(
            isForAdults: isForAdults,
            backdropPath: backdropPath,
            genreIds: genreIds,
            id: id,
            title: title,
            originalLanguage: originalLanguage,
            originalTitle: originalTitle,
            overview: overview,
            popularity: popularity,
            posterPath: posterPath,
            releaseDate: DateFormatter().apply { $0.dateFormat = YYYYMMDD }.date(from: releaseDate),
            isSoftCore: isSoftCore,
            isInVideo: isInVideo,
            voteAverage: voteAverage,
            voteCount: voteCount,
        )
    }
}

internal extension MoviesResultDto {
    func toDomain() -> MoviesResult {
        return MoviesResult(
            page: page,
            movies: results.map { dto in dto.toDomain() },
            totalPages: totalPages,
            totalResults: totalResults,
        )
    }
}

private extension DateFormatter {
    func apply(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}
