//
//  TrendingMoviesUITests.swift
//  TrendingMoviesUITests
//
//  Created by Nabil Kazi on 27/02/19.
//

import XCTest

class TrendingMoviesUITests: XCTestCase {

    var app: XCUIApplication!
    var tableViewCells : XCUIElementQuery!
    var tableViewFirstCell : XCUIElement!
    var activityIndicator : XCUIElement!
    var movieDetailsView : XCUIElement!
    
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        app = XCUIApplication()
        app.launch()
        accessViews()
    }

    override func tearDown() {
        app = nil
        tableViewCells = nil
        tableViewFirstCell = nil
        activityIndicator = nil
        super.tearDown()
    }
    
    func test_tableViewSelection_displaysMovieDetails_whenSelectingRow(){
        openMoviesList()
        tableViewFirstCell.tap()
        XCTAssertTrue(isDisplayingMovieDetailsView)
        closeDetailsView()
    }

}

extension TrendingMoviesUITests {
    
    func accessViews(){
        activityIndicator = app.activityIndicators["indicator"]
        tableViewCells = app.tables.cells
        tableViewFirstCell = tableViewCells.element(boundBy: 0)
        movieDetailsView = app.otherElements["movieDetailsView"]
    }
    
    func openMoviesList(){
        if isDisplayingLoadingIndicator{
            XCTAssertTrue(waitToHide(activityIndicator))
        }
        if tableViewCells.count > 0 {
            XCTAssertTrue(true, "Finished validating the table cells")
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
    
    func closeDetailsView(){
        XCTAssertTrue(isDisplayingMovieDetailsView)
        let backButton = app.navigationBars.buttons.element(boundBy: 0)
        backButton.tap()
        XCTAssertFalse(isDisplayingMovieDetailsView)
    }
}

extension TrendingMoviesUITests {
    
    var isDisplayingLoadingIndicator: Bool {
        return activityIndicator.exists
    }
    
    var isDisplayingMovieDetailsView: Bool {
        return movieDetailsView.exists
    }
}


extension XCTestCase{
    
    func waitToHide(_ element: XCUIElement) -> Bool{
        let notExists = NSPredicate(format: "exists == false")
        let hideExpectation = expectation(for: notExists, evaluatedWith: element, handler: nil)
        let result = XCTWaiter().wait(for: [hideExpectation], timeout: 5)
        return result == .completed
    }
}
