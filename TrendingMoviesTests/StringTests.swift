//
//  StringTests.swift
//  TrendingMoviesTests
//
//  Created by Nabil Kazi on 03/03/19.
//

import XCTest
@testable import TrendingMovies

class StringTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testLocalized() {
        
        let defaultString = NSLocalizedString("string.test", comment: "")
        let utilityString = "string.test".localized()
        
        XCTAssertEqual(defaultString, utilityString)
    }
}
