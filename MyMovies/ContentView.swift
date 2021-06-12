//
//  ContentView.swift
//  MyMovies
//
//  Created by Paul Hudson on 12/05/2021.
//

import SDWebImageSwiftUI
import SwiftUI

struct ContentView: View {
    @State private var movieResults = MovieResults(results: [])
        
    var body: some View {
        List {
            ForEach(movieResults.results) { movie in
                HStack {
                    Group {
                        if let path = movie.posterPath {
                            WebImage(url: URL(string: "https://image.tmdb.org/t/p/w342\(path)"))
                                .placeholder(Image("Loading").resizable())
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 90)
                        } else {
                            Image("NoPoster")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 90)
                        }
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
