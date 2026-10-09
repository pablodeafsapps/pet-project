//
//  ContentView.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 29/09/2026.
//

import SwiftUI

struct ContentView: View {
    
    private let moviesFeatureFactory: MoviesFeatureFactory
    @State private var path = NavigationPath()

    init(moviesFeatureFactory: MoviesFeatureFactory) {
        self.moviesFeatureFactory = moviesFeatureFactory
    }
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                NavigationLink("Show top-rated movies", value: "top-rated-movies")
            }
            .padding()
            .navigationDestination(for: String.self) { _ in
                DetailView(
                    fetchMoviesUseCase: moviesFeatureFactory.makeFetchMoviesUseCase()
                )
            }
        }
    }
}

#Preview {
    ContentView(moviesFeatureFactory: .preview)
}
