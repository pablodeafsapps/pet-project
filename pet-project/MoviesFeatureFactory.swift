//
//  MoviesFeatureFactory.swift
//  pet-project
//

import Foundation

/// Composes the Movies feature without exposing construction details to SwiftUI views.
///
/// The factory is safe to retain at the app level because it only keeps immutable
/// configuration and platform infrastructure. Each `make...` call creates a new
/// feature dependency graph.
struct MoviesFeatureFactory {
    private let configuration: TMDBConfiguration
    private let session: URLSession

    init(configuration: TMDBConfiguration, session: URLSession = .shared) {
        self.configuration = configuration
        self.session = session
    }

    func makeFetchMoviesUseCase() -> FetchMoviesUseCase {
        let dataSource = MoviesRemoteDataSource(
            url: configuration.topRatedMoviesURL,
            session: session
        )
        let repository = DefaultMoviesRepository(
            moviesDataSource: dataSource,
            accessToken: configuration.accessToken
        )

        return FetchMoviesUseCase(moviesRepository: repository)
    }
}

struct TMDBConfiguration {
    let accessToken: String
    let topRatedMoviesURL: URL

    init(accessToken: String, topRatedMoviesURL: URL) {
        self.accessToken = accessToken
        self.topRatedMoviesURL = topRatedMoviesURL
    }

    init?(bundle: Bundle) {
        guard
            let accessToken = bundle.object(forInfoDictionaryKey: "TmdbAccessToken") as? String,
            let apiPath = bundle.object(forInfoDictionaryKey: "TmdbApiPath") as? String,
            let endpoint = bundle.object(forInfoDictionaryKey: "TmdbTopRatedMoviesEndpoint") as? String,
            let topRatedMoviesURL = URL(string: apiPath + endpoint)
        else {
            return nil
        }

        self.init(accessToken: accessToken, topRatedMoviesURL: topRatedMoviesURL)
    }
}

extension MoviesFeatureFactory {
    static let preview = MoviesFeatureFactory(
        configuration: TMDBConfiguration(
            accessToken: "preview-token",
            topRatedMoviesURL: URL(string: "https://example.com/movie/top_rated")!
        )
    )
}
