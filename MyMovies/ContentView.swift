//
//  ContentView.swift
//  MyMovies
//
//  Created by Paul Hudson on 12/05/2021.
//

import SwiftUI

struct ContentView: View {
    @State private var movieResults = Bundle.main.decode(MovieResults.self, from: "results.json", keyDecodingStrategy: .convertFromSnakeCase)
    
    var body: some View {
        List {
            ForEach(movieResults.results) { movie in
                Text("\(movie.title)")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
