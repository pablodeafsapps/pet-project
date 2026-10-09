//
//  pet_projectApp.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 29/09/2026.
//

import SwiftUI

@main
struct pet_projectApp: App {
    private let moviesFeatureFactory: MoviesFeatureFactory

    init() {
        guard let configuration = TMDBConfiguration(bundle: .main) else {
            fatalError("The TMDB configuration is missing or invalid.")
        }

        moviesFeatureFactory = MoviesFeatureFactory(configuration: configuration)
    }

    var body: some Scene {
        WindowGroup {
            ContentView(moviesFeatureFactory: moviesFeatureFactory)
        }
    }
}
