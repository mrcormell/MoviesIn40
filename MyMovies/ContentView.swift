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
                VStack(alignment: .leading) {
                    Text("\(movie.title)")
                        .font(.title2)
                    HStack {
                        Text("\(movie.releaseDate)")
                        Text("\(movie.voteAverage, specifier: "%g")/10")
                    }
                    Text("\(movie.overview)")
                        .lineLimit(2)
                        .font(Font.body.italic())
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
