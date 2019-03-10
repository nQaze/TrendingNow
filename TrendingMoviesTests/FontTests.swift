//
//  FontTests.swift
//  TrendingMoviesTests
//
//  Created by Nabil Kazi on 03/03/19.
//

import XCTest
@testable import TrendingMovies

class FontTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testFontWithSize() {
        
        let fontSize: CGFloat = 12.0
        let font = Font.regular.withSize(fontSize)
        
        XCTAssertEqual(font.pointSize, fontSize)
    }
}
