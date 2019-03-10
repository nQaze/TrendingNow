//
//  MockAPIController.swift
//  TrendingMoviesTests
//
//  Created by Nabil Kazi on 05/03/19.
//

import Foundation
@testable import TrendingMovies

class MockAPIController: MoviesAPIController {
    
    override func getTrending(media : MediaType, forDuration : TimeWindow, completion: @escaping (_ response: [APIMovie]?, _ error: Error?) -> Void) {
        completion(getSampleMovies(), nil)
    }
    
}

extension MockAPIController{
    func getSampleMovies() -> [APIMovie] {
        var movies: [APIMovie] = []
        movies.append(APIMovie(id: 1, name: "Avengers", title: "Avengers",
                               overview: "Infinity War", backdropPath: "", posterPath: "",
                               releaseDate: "", voteAverage: 8.0))
        movies.append(APIMovie(id: 2, name: "Avengers2", title: "Avengers",
                               overview: "Infinity War 2", backdropPath: "", posterPath: "",
                               releaseDate: "", voteAverage: 9.0))
        movies.append(APIMovie(id: 3, name: "Avengers3", title: "Avengers",
                               overview: "Infinity War 3", backdropPath: "", posterPath: "",
                               releaseDate: "", voteAverage: 9.5))
        return movies
    }
}
