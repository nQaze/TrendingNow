//
//  MoviesDataController.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 27/02/19.
//

import Foundation

class MoviesAPIController {
    
    func getTrending(media : MediaType, forDuration : TimeWindow, completion: @escaping (_ response: [APIMovie]?, _ error: Error?) -> Void) {
        
        GetTrendingMoviesConfiguration(mediaType: media, timeWindow: forDuration).start { (response) in
            switch response {
            case let .success(response):
                do {
                    let responseObj = try JSONDecoder().decode(TrendingMoviesResponse.self, from: response!)
                    completion(responseObj.results, nil)
                } catch let error {
                    print("JSON Error \(error)")
                    completion(nil, WebServiceError.invalidResponse)
                }
            case let .failure(error):
                print("getTrendingMovies API Failed : \(error)")
                completion(nil, error)
            }
        }
    }
}
