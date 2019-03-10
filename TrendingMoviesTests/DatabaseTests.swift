//
//  TrendingMoviesTests.swift
//  TrendingMoviesTests
//
//  Created by Nabil Kazi on 27/02/19.
//

import XCTest
import CoreData
@testable import TrendingMovies

class DatabaseTests: XCTestCase {

    var sut: MovieDataManager!
    var mockCoreDataManager: MockCoreDataManager!
    var mockPersistantContainer : NSPersistentContainer!
    
    override func setUp() {
        super.setUp()
        initStubs()
        sut = MovieDataManager(container: mockPersistantContainer)
    }

    override func tearDown() {
        flushData()
        super.tearDown()
    }

    func test_insertMovie() {
        let apiMovie = APIMovie(id: 1, name: "Avengers", title: "Avengers",
                                overview: "Infinity War", backdropPath: "", posterPath: "",
                                releaseDate: "", voteAverage: 8.0)
        let movie = sut.insertMovie(apiMovie)
        XCTAssertNotNil(movie)
    }
    
    func test_movieData() {
        let apiMovie = APIMovie(id: 1, name: "Fantastic Beasts", title: "Fantastic Beasts",
                                overview: "The Crimes of Grindelwald",
                                backdropPath: "/uUiId6cG32JSRI6RyBQSvQtLjz2.jpg",
                                posterPath: "/kQKcbJ9uYkTQql2R8L4jTUz7l90.jpg",
                                releaseDate: "2018-11-14", voteAverage: 8.0)
        guard let movie = sut.insertMovie(apiMovie) else {
            return XCTFail("Movie object not inserted in database")
        }
        
        XCTAssertEqual(movie.id, 1)
        XCTAssertEqual(movie.title, "Fantastic Beasts")
        XCTAssertEqual(movie.overview, "The Crimes of Grindelwald")
        XCTAssertEqual(movie.rating, 8.0)
        XCTAssertEqual(movie.releaseDate, "2018-11-14")
        XCTAssertEqual(movie.posterImage, "/kQKcbJ9uYkTQql2R8L4jTUz7l90.jpg")
        XCTAssertEqual(movie.backdropImage, "/uUiId6cG32JSRI6RyBQSvQtLjz2.jpg")
    }
    
    func test_fetchAllMovies() {
        let results = sut.fetchAllMovies()
        XCTAssertEqual(results.count, 3)
    }

}

extension DatabaseTests {
    
    func initMockDatabase(){
        mockCoreDataManager = MockCoreDataManager()
        mockPersistantContainer = mockCoreDataManager.mockPersistantContainer
    }
    
    func initStubs() {
        
        initMockDatabase()
        
        func insertMovie(_ movie: APIMovie) -> Movie?{
            guard let movieItem = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: mockPersistantContainer.viewContext) as? Movie else { return nil }
            
            movieItem.id = Int64(movie.id)
            movieItem.title = movie.title ?? movie.name
            movieItem.overview = movie.overview
            movieItem.rating = movie.voteAverage
            movieItem.releaseDate = movie.releaseDate
            movieItem.posterImage = movie.posterPath
            movieItem.backdropImage = movie.backdropPath
            
            return movieItem
        }
        
        
        _ = insertMovie(APIMovie(id: 1, name: "Avengers", title: "Avengers",
                                 overview: "Infinity War", backdropPath: "", posterPath: "",
                                 releaseDate: "", voteAverage: 8.0))
        _ = insertMovie(APIMovie(id: 2, name: "Avengers2", title: "Avengers",
                                 overview: "Infinity War 2", backdropPath: "", posterPath: "",
                                 releaseDate: "", voteAverage: 9.0))
        _ = insertMovie(APIMovie(id: 3, name: "Avengers3", title: "Avengers",
                                 overview: "Infinity War 3", backdropPath: "", posterPath: "",
                                 releaseDate: "", voteAverage: 9.5))
        
        do {
            try mockPersistantContainer.viewContext.save()
        }  catch {
            print("create fakes error \(error)")
        }
        
    }
    
    func flushData() {
        let fetchRequest:NSFetchRequest<NSFetchRequestResult> = NSFetchRequest<NSFetchRequestResult>(entityName: "Movie")
        let objs = try! mockPersistantContainer.viewContext.fetch(fetchRequest)
        for case let obj as NSManagedObject in objs {
            mockPersistantContainer.viewContext.delete(obj)
        }
        try! mockPersistantContainer.viewContext.save()
    }
    
    func numberOfItemsInPersistentStore() -> Int {
        let request: NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Movie")
        let results = try! mockPersistantContainer.viewContext.fetch(request)
        return results.count
    }
    
}
