//
//  ContentView.swift
//  MyMovies
//
//  
//

import SwiftUI

struct ContentView: View {
    @State private var movieResults = MovieResults(results: [])
        
    var body: some View {
        List {
            ForEach(movieResults.results) { movie in
                HStack {
                    if let path = movie.posterPath {
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w342\(path)")) { image in image.resizable() } placeholder: { Color.gray }
                            .frame(width: 60, height: 90)
                    }
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
        .onAppear(perform: {
            getMovies()
        })
    }
    
    func getMovies() {
        URLSession.shared.get(path: "search/movie", queryItems: ["query":"best"], defaultValue: MovieResults(results: []), completion: { results in
            movieResults = results
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
