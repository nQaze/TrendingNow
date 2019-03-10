//
//  Constants.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 27/02/19.
//

import Foundation

struct Constants {
    
    // API
    static let baseUrl = "https://api.themoviedb.org"
    static let apiVersion = "3"
    static let apiBaseUrl = "\(baseUrl)/\(apiVersion)/"
    static let apiImageUrl = "https://image.tmdb.org/t/p/w500/"
    
    //Keys
    static let apiKey = key
    static let apiReadAccessToken = accessToken
    
    static let noMoviesMessage = "Uh ho! No movies found :("
}

struct Storyboard {
    static let main = "Main"
}

struct Cells {
    static let movie = "movieCell"
}

struct Views {
    static let movieTableViewCell = "MovieTableViewCell"
}

struct SegueIdentifier {
    static let showMovieDetails = "showMovieDetailsVC"
}
