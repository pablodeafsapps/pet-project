//
//  DetailView.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 29/09/2026.
//

import SwiftUI

struct DetailView: View {
    
    let fetchMoviesUseCase: FetchMoviesUseCase
    @State internal var detailViewState: DetailViewState = .loading
    
    var body: some View {
        Group {
            switch detailViewState {
                case .error(let errorMessage):
                    Text(errorMessage ?? "Try again later.")
                        .padding(5.0)
                        .multilineTextAlignment(.center)
                case .loading:
                    ProgressView()
                case .data(let movies):
                    List(movies) { movie in
                        Text(movie.title)
                    }
            }
        }.task {
            switch await fetchMoviesUseCase() {
                case .success(let moviesResult):
                    detailViewState = .data(movies: moviesResult.movies)
                case .failure(let error):
                    detailViewState = .error(errorMessage: error.localizedDescription)
            }
        }
    }
}

internal enum DetailViewState {
    case error(errorMessage: String?)
    case loading
    case data(movies: [Movie])
}

#Preview {
    DetailView(
        fetchMoviesUseCase: FetchMoviesUseCase(
            moviesRepository: PreviewMoviesRepository()
        ),
        detailViewState: .loading
    )
}

private struct PreviewMoviesRepository: MoviesRepository {
    func fetchMovies() async -> Result<MoviesResult, Error> {
        .failure(MovieError.unknown)
    }
}
