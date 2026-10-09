//
//  MovieError.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 01/10/2026.
//

import Foundation

enum MovieError: LocalizedError {
    case invalidUrl
    case badAuthentication
    case badRequest
    case notFound
    case notAvailable
    case unknown
    
    var errorDescription: String? {
        switch self {
            case .invalidUrl: return "Invalid URL"
            case .badAuthentication: return "Cannot authenticate"
            case .badRequest: return "Bad request"
            case .notFound: return "Movie not found"
            case .notAvailable: return "Movie not available"
            case .unknown: return "Unknown"
        }
    }
        
    var errorCode: Int {
        switch self {
            case .invalidUrl: return 1030
            case .badAuthentication: return 1031
            case .badRequest: return 1040
            case .notFound: return 1044
            case .notAvailable: return 1045
            case .unknown: return 1060
        }
    }
}

enum NetworkError: LocalizedError {
    case transport(_ transportErrorMessage: String)
    case decoding(_ decodingErrorMessage: String)
    case server(_ serverErrorMessage: String)

    var errorDescription: String? {
        switch self {
            case .transport(let transportErrorMessage): return "Transport Error: \(transportErrorMessage)"
            case .decoding(let decodingErrorMessage): return "Decoding error: \(decodingErrorMessage)"
            case .server(let serverErrorMessage): return "Server Errors: \(serverErrorMessage)"
        }
    }
        
    var errorCode: Int {
        switch self {
            case .transport: return 5030
            case .decoding: return 5060
            case .server: return 5050
        }
    }
}
