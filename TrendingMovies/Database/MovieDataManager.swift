//
//  MovieDataManager.swift
//  TrendingMovies
//
//  Created by Nabil Kazi on 03/03/19.
//

import UIKit
import CoreData

class MovieDataManager {
    
    let persistentContainer: NSPersistentContainer!
    
    init(container: NSPersistentContainer) {
        self.persistentContainer = container
        self.persistentContainer.viewContext.automaticallyMergesChangesFromParent = true
    }
    
    convenience init() {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError("Can not get shared app delegate")
        }
        self.init(container: appDelegate.persistentContainer)
    }
    
}

extension MovieDataManager{
    
    func insertMovie(_ movie: APIMovie) -> Movie?{
        guard let movieItem = NSEntityDescription.insertNewObject(forEntityName: "Movie", into: persistentContainer.viewContext) as? Movie else { return nil }
        
        movieItem.id = Int64(movie.id)
        movieItem.title = movie.title ?? movie.name
        movieItem.overview = movie.overview
        movieItem.rating = movie.voteAverage
        movieItem.releaseDate = movie.releaseDate
        movieItem.posterImage = movie.posterPath
        movieItem.backdropImage = movie.backdropPath
        
        return movieItem
    }
    
    func getMoviesFromResult(_ results: [APIMovie]) -> [Movie] {
        var movies: [Movie] = []
        for result in results {
            if let movie = insertMovie(result){
                movies.append(movie)
            }
        }
        return movies
    }
    
    func fetchAllMovies() -> [Movie] {
        let request: NSFetchRequest<Movie> = Movie.fetchRequest()
        let results = try? persistentContainer.viewContext.fetch(request)
        return results ?? [Movie]()
    }
}
