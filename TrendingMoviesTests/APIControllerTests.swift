//
//  APIControllerTests.swift
//  TrendingMoviesTests
//
//  Created by Nabil Kazi on 03/03/19.
//

import XCTest
@testable import TrendingMovies

class APIControllerTests: XCTestCase {

    var moviesAPIController: MoviesAPIController!
    
    override func setUp() {
        super.setUp()
        moviesAPIController = MoviesAPIController()
    }
    
    override func tearDown() {
        moviesAPIController = nil
        super.tearDown()
    }

    func test_getTrendingMovies() {
        
        let testExpectation = expectation(description: "getTrendingMovies should not return an error")
        
        moviesAPIController.getTrending(media: MediaType.movie, forDuration: TimeWindow.day) { (_, error) in
            XCTAssertNil(error)
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }
}
