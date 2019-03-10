//
//  MovieViewModel.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 05/03/19.
//

import Foundation
class MovieViewModel : NSObject {
    
    var title : String
    var overview : String
    var rating : String
    var posterPath : String
    var backdropPath : String
    var releaseDate : String
    
    init(movie : Movie) {
        self.title = movie.title ?? ""
        self.overview = movie.overview ?? ""
        self.rating = "\(movie.rating)"
        self.posterPath = movie.posterImage ?? ""
        self.backdropPath = movie.backdropImage ?? ""
        self.releaseDate = movie.releaseDate!.displayDateString
    }
}
