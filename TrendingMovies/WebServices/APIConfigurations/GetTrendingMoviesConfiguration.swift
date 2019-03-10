//
//  GetTrendingConfiguration.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 27/02/19.
//

import Foundation

struct GetTrendingMoviesConfiguration: WebServiceConfiguration {
    
    typealias Response = Data
    
    var method: HTTPMethod { return .get }
    
    let mediaType : MediaType
    let timeWindow : TimeWindow
    
    var pathComponents: [String] {
        return ["trending", mediaType.rawValue, timeWindow.rawValue]
    }
    
    var queryParameters: [QueryParameter]? {
        return [(name: "api_key", value: Constants.apiKey as AnyObject)]
    }
    
    var requestBody: Data? {
        return nil
    }
}

enum MediaType : String{
    case all, movie, tv, person
}

enum TimeWindow : String{
    case day, week
}

struct TrendingMoviesResponse: Codable {
    let page: Int
    let results: [APIMovie]
    let totalPages, totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct APIMovie: Codable {
    let id: Int
    let name, title: String?
    let overview: String
    let backdropPath: String
    let posterPath: String
    let releaseDate: String?
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id, name, title, overview
        case backdropPath = "backdrop_path"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
