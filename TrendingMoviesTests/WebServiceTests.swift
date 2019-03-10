//
//  WebServiceTests.swift
//  TrendingMoviesTests
//
//  Created by Nabil Kazi on 03/03/19.
//

import XCTest
@testable import TrendingMovies

class WebServiceTests: XCTestCase {

    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }

    func test_callGetTrendingMoviesAPI() {
        
        let testExpectation = expectation(description: "Should return list of all trending movies")
        
        GetTrendingMoviesConfiguration(mediaType: MediaType.movie, timeWindow: TimeWindow.day).start { (response) in
            switch response {
            case let .success(response):
                XCTAssertNotNil(response)
            case let .failure(error):
                XCTFail("web service error: \(error)")
            }
            testExpectation.fulfill()
        }
        
        waitForExpectations(timeout: 10) { error in
            if let error = error {
                XCTFail("waitForExpectationsWithTimeout errored: \(error)")
            }
        }
    }

}
