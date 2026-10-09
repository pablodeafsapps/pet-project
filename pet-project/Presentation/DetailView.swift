//
//  DetailView.swift
//  pet-project
//
//  Created by Pablo L. Sordo Martinez on 29/09/2026.
//

import SwiftUI

struct DetailView: View {
    
    let entryText: String
    
    var body: some View {
        Text("Detail View!\n\(entryText)")
        Button("Get me some films!") {
            
        Task {
            do {
                let data = try await fetchFilmsData(apiKey: entryText)
                print("Received: \(data ?? "none")")
            } catch {
                print("Error: \(error)")
            }
        }
        }
        .buttonStyle(.borderedProminent)
    }
}

private func fetchFilmsData(apiKey: String) async throws -> String? {
    guard let url = URL(string: "https://api.themoviedb.org/3/movie/top_rated") else {
        return nil
    }
    var request = URLRequest(url: url)
    request.setValue("Bearer \(apiKey)", forHTTPHeaderField: "Authorization")
    
    let (data, response) = try await URLSession.shared.data(for: request)
    guard let httpResponse = response as? HTTPURLResponse,
            (200...299).contains(httpResponse.statusCode) else {
        print(String(describing: response))
        return nil
    }
    return String(describing: data)
}

#Preview {
    DetailView(entryText: "Wow!")
}
