//
//  MovieListVCTests.swift
//  TrendingMoviesTests
//
//  Created by Nabil Kazi on 03/03/19.
//

import XCTest
import CoreData
@testable import TrendingMovies

class MovieListVCTests: XCTestCase {

    var sut: MovieListVC!
    var window: UIWindow!
    var navigationController: UINavigationController!

    override func setUp() {
        super.setUp()
        
        let storyboard = UIStoryboard(name: Storyboard.main ,bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "MovieListVC") as? MovieListVC else {
            return XCTFail("Could not instantiate MovieDetailsVC from main storyboard")
        }
        sut = vc
        sut.loadViewIfNeeded()
        navigationController = UINavigationController(rootViewController: sut)
        window = UIWindow()
        window.rootViewController = sut
        window.makeKeyAndVisible()
    }

    override func tearDown() {
        sut = nil
        window = nil
        navigationController = nil
        super.tearDown()
    }

    func test_movieListVC_hasATableView() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func test_tableView_hasDelegate() {
        XCTAssertNotNil(sut.tableView.delegate)
    }
    
    func test_tableView_confromsToTableViewDelegateProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDelegate.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:didSelectRowAt:))))
    }
    
    func test_tableView_hasDataSource() {
        XCTAssertNotNil(sut.tableView.dataSource)
    }
    
    func test_tableView_conformsToTableViewDataSourceProtocol() {
        XCTAssertTrue(sut.conforms(to: UITableViewDataSource.self))
        XCTAssertTrue(sut.responds(to: #selector(sut.numberOfSections(in:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:numberOfRowsInSection:))))
        XCTAssertTrue(sut.responds(to: #selector(sut.tableView(_:cellForRowAt:))))
    }
    
}

extension XCTestCase{
    
    func waitToShow(_ element: XCUIElement){
        let exists = NSPredicate(format: "exists == true")
        let hideExpectation = expectation(for: exists, evaluatedWith: element, handler: nil)
        XCTWaiter().wait(for: [hideExpectation], timeout: 5)
    }
}
