//
//  MovieListViewModelTests.swift
//  TrendingMoviesTests
//
//  Created by Nabil Kazi on 05/03/19.
//

import XCTest
import CoreData
@testable import TrendingMovies

class MovieListViewModelTests: XCTestCase {
    
    var movieListViewModel: MovieListViewModel!
    var mockCoreDataManager: MockCoreDataManager!
    var mockPersistantContainer: NSPersistentContainer!
    var mockAPIController: MockAPIController!
    
    override func setUp() {
        super.setUp()
        mockCoreDataManager = MockCoreDataManager()
        mockPersistantContainer = mockCoreDataManager.mockPersistantContainer
        mockAPIController = MockAPIController()
        movieListViewModel = MovieListViewModel(apiController: mockAPIController, movieDataManager: mockCoreDataManager)
    }
    
    override func tearDown() {
        movieListViewModel = nil
        mockCoreDataManager = nil
        mockPersistantContainer = nil
        mockAPIController = nil
        super.tearDown()
    }
    
    func test_successMoviesResponse_generatesMovieModels() {
        // Since we are returning 3 APIMovies objects in mockAPIController inside the movieListViewModel
        XCTAssertEqual(movieListViewModel.movieViewModels.count, 3)
    }
}

