//
//  ContentView.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 29/09/2026.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        let tmdbAccessToken = Bundle.main.infoDictionary?["TmdbAccessToken"] as? String
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!\n\(tmdbAccessToken!)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
