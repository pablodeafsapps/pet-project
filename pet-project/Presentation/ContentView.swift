//
//  ContentView.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 29/09/2026.
//

import SwiftUI

struct ContentView: View {
    
    @State var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            let tmdbAccessToken = Bundle.main.infoDictionary?["TmdbAccessToken"] as? String
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                NavigationLink("Hello, world!\n\(tmdbAccessToken!)", value: tmdbAccessToken!)
            }
            .padding()
            .navigationDestination(for: String.self) { message in
                DetailView(entryText: message)
            }
        }
    }
}

#Preview {
    @Previewable @State var path = NavigationPath()
    
    NavigationStack(path: $path) {
        ContentView()
    }
}
