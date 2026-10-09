//
//  MovieDataSource.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 01/10/2026.
//

import Foundation

private let authorizationHeader = "Authorization"
private let bearerTokenPrefix = "Bearer"

internal protocol MoviesDataSource {
    func fetchMoviesData(apiKey: String) async -> Result<MoviesResultDto, Error>
}

internal struct MoviesRemoteDataSource: MoviesDataSource {
    private let url: URL
    private let session: URLSession

    init(url: URL, session: URLSession) {
        self.url = url
        self.session = session
    }

    internal func fetchMoviesData(apiKey: String) async -> Result<MoviesResultDto, Error> {
        var request = URLRequest(url: url)
        request.setValue("\(bearerTokenPrefix) \(apiKey)", forHTTPHeaderField: authorizationHeader)
        
        do {
            let (data, response) = try await session.data(for: request)
            guard let httpResponse = response as? HTTPURLResponse else { return .failure(MovieError.unknown) }
            return try httpResponse.process(data: data)
        } catch let error as URLError {
            return .failure(NetworkError.transport(error.localizedDescription))
        } catch let DecodingError.keyNotFound(key, context) {
            return .failure(NetworkError.decoding("Missing key: \(key.stringValue) at path: \(context.codingPath)"))
        } catch let error as DecodingError {
            return .failure(NetworkError.decoding(error.localizedDescription))
        } catch {
            return .failure(NetworkError.server(error.localizedDescription))
        }
    }
}

extension HTTPURLResponse {
    func process<T: Decodable>(data: Data) throws -> Result<T, Error> {
        switch self.statusCode {
            case (200...299):
                return try .success(JSONDecoder().apply { $0.keyDecodingStrategy = .convertFromSnakeCase }.decode(T.self, from: data))
            case (300...399):
                return .failure(MovieError.badAuthentication)
            case (400...499):
                return .failure(MovieError.badRequest)
            case (500...599):
                return .failure(MovieError.notAvailable)
            default:
                return .failure(MovieError.unknown)
        }
    }
}

private extension JSONDecoder {
    func apply(_ block: (Self) -> Void) -> Self {
        block(self)
        return self
    }
}
